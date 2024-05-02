//
//  NowPlayingGetterConfigurator.swift
//  Muplay
//
//  Created by Ariesta APP on 02/05/24.
//

import Foundation
class NowPlayingGetterConfigurator {
    static let shared = NowPlayingGetterConfigurator()
    private var context = NowPlayingGetterContext()
}

extension NowPlayingGetterConfigurator {
    func createNowPlayingModule() -> NowPlayingGetterPresenter {
        let interactor: NowPlayingGetterInteractorDelegate = NowPlayingGetterInteractor.shared
        let presenter: NowPlayingGetterPresenterDelegate = NowPlayingGetterPresenter.shared
        presenter.interactor = interactor
        return presenter as! NowPlayingGetterPresenter
    }
}
