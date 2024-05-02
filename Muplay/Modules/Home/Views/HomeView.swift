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
    }
    
    func setupTrackInfo(track: MediaRemoteTrackInfo) {
        self.titleLabel.stringValue = track.name ?? .emptyString
    }
    
}



