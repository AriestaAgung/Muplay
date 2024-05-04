//
//  HomeView.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class HomeView: BaseViewController, HomeViewDelegate {
    var presenter: (any HomePresenterDelegate)?
    @IBOutlet weak var titleLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupBackgroundColor(color: .black)
    }
    
    
    func setupView() {
//        bgColor = .clear
        titleLabel.delegate = self
    }
    
    func setupTrackInfo(track: MediaRemoteTrackInfo) {
        self.titleLabel.stringValue = track.name ?? .emptyString
        self.titleLabel.font = .boldSystemFont(ofSize: 20)
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
