//
//  HomeConfigurator.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation
import AppKit

class HomeConfigurator {
    static let shared = HomeConfigurator()
    private var context = HomeContext()
}

extension HomeConfigurator {
    func createHomeModule() -> NSViewController {
        let view: HomeView & HomeViewDelegate = HomeView()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        return view
    }
}
