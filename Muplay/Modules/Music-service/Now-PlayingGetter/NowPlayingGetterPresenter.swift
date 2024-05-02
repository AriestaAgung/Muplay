//
//  NowPlayingGetterPresenter.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

class NowPlayingGetterPresenter: NowPlayingGetterPresenterDelegate {
    var interactor: NowPlayingGetterInteractorDelegate?
    static let shared = NowPlayingGetterPresenter()
    
    private var currentTrackInfo: MediaRemoteTrackInfo?
    
    func setTrackObserver(action: Selector){
        NowPlayingGetterInteractor.shared.setTrackObserver(action: action)
        self.interactor?.setTrackObserver(action: action)
        print("FETCHED")
    }
}
