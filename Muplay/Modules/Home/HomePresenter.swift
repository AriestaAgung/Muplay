//
//  HomePresenter.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

class HomePresenter: HomePresenterDelegate {
    var interactor: (any HomeInteractorDelegate)?
    var view: HomeView?
    private var currentTrack: MediaRemoteTrackInfo?
    private var trackSetAction: (() -> Void)?
    
    func setupTrackInfo() {
        
    }
    
    func viewDidLoad() {
        fetchCurrentTrack()
    }
    func setTrackName() {
        
    }
    
    func fetchCurrentTrack() {
        MediaRemoteHelper.shared.run()
        trackSetAction?()
        NotificationCenter.default.addObserver(self, selector: #selector(getMusicTrackInfo(_:)), name: MediaRemoteConstant.Notification.musicChangedNotification, object: nil)
        
    }
    
    @objc func getMusicTrackInfo(_ notification: Notification) {
        guard let track = notification.userInfo?[MediaRemoteConstant.Notification.postTrackName] as? MediaRemoteTrackInfo else {
            return
        }
        self.view?.setupTrackInfo(track: track)
    }
}
