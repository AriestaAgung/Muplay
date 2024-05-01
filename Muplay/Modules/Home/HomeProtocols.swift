//
//  HomeProtocols.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    var presenter: HomePresenterDelegate? { get set }
}

protocol HomePresenterDelegate: AnyObject {
    var interactor: HomeInteractorDelegate? { get set }
}

protocol HomeInteractorDelegate: AnyObject {
    
}

