//
//  NowPlayingGetterProtocols.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

protocol NowPlayingGetterPresenterDelegate: AnyObject {
    var interactor: NowPlayingGetterInteractorDelegate? { get set }
}

protocol NowPlayingGetterInteractorDelegate: AnyObject {
    func getCurrentSong() -> MediaRemoteTrackInfo
}
