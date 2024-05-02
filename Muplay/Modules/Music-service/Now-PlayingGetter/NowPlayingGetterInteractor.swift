//
//  NowPlayingGetterInteractor.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation
import MediaPlayer

class NowPlayingGetterInteractor: NowPlayingGetterInteractorDelegate {
    static let shared = NowPlayingGetterInteractor()
    func getCurrentSong() -> MediaRemoteTrackInfo {
        MediaRemoteHelper.shared
        NotificationCenter.default.addObserver(self, selector: #selector(getMusicTrackInfo(_:)), name: MediaRemoteConstant.Notification.musicChangedNotification, object: nil)
        
        return MediaRemoteTrackInfo(name: nil, artist: nil, playing: false)
    }
    
    @objc func getMusicTrackInfo(_ notification: Notification) {
        print("NIL")
        guard let track = notification.userInfo?[MediaRemoteConstant.Notification.postTrackName] as? MediaRemoteTrackInfo else {
            print("NIL")
            return
        }
        print("TRACK: \(track.name)")
    }
    
}
