//
//  NowPlayingGetterConfigurator.swift
//  Muplay
//
//  Created by Ariesta APP on 02/05/24.
//

import Foundation
class NowPlayingGetterConfigurator {
    static let shared = HomeConfigurator()
    private var context = HomeContext()
}

extension NowPlayingGetterConfigurator {
    func createNowPlayingModule() {
        let interactor: NowPlayingGetterInteractorDelegate = NowPlayingGetterInteractor.shared
        
    }
}
