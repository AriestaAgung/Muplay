//
//  HomeView.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa
import SnapKit

class HomeView: BaseViewController, HomeViewDelegate {
    var presenter: (any HomePresenterDelegate)?
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var lyricLabel: NSTextField!
    
    @IBOutlet weak var artworkImage: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    
    func setupView() {
        titleLabel.stringValue = "Loading Song..."
        setupBackgroundColor(color: NSColor.windowBackgroundColor.withAlphaComponent(0.3).cgColor)
//        view.snp.makeConstraints { make in
//            make.height.lessThanOrEqualTo(300)
//        }
    }
    
    func setupTrackInfo(track: MediaRemoteTrackInfo) {
        print("TRACKINFO: \(track)")
        
        if track.name == nil {
            self.titleLabel.stringValue = "fetch track..."
        } else  if track.name == .emptyString {
            self.titleLabel.stringValue = "Cannot fetch track..."
        } else {
            self.titleLabel.stringValue = track.name ?? "fetch track..."
            self.artworkImage.image = NSImage(data: track.artwork ?? Data())
            MusicFetcherInteractor.shared.fetchSong(title: track.name ?? .emptyString) { data, err in
                dump(data)
                self.lyricLabel.stringValue = data?.description?.text ?? track.name ?? err?.localizedDescription ?? .emptyString
            }
        }
        
        self.titleLabel.font = .boldSystemFont(ofSize: 20)
        self.titleLabel.textColor = .orange
        self.lyricLabel.font = .labelFont(ofSize: 15)
        self.lyricLabel.textColor = .orange
    }
    
}

extension HomeView: NSTextFieldDelegate {
    func controlTextDidChange(_ obj: Notification) {
        guard let field = obj.object as? NSTextField else {
            return
          }

          // re-apply the string value, this is necessary for the text field to correctly calculate it's width
          field.stringValue = field.stringValue

          // calculate the new dimensions
          let maxWidth: CGFloat = 500
          let maxHeight: CGFloat = 50
          let size = titleLabel.sizeThatFits(NSSize(width: maxWidth, height: maxHeight))

          // apply them
          field.frame = NSRect(x: field.frame.origin.x, y: field.frame.origin.y, width: size.width, height: size.height)
        
    }
}
