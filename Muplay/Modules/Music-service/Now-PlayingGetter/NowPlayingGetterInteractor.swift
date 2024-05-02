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
    
    func setTrackObserver(action: Selector) {
        MediaRemoteHelper.shared.run()
        NotificationCenter.default.addObserver(self, selector: action, name: MediaRemoteConstant.Notification.musicChangedNotification, object: nil)
    }
}
