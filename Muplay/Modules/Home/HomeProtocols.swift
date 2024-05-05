//
//  HomeProtocols.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    var presenter: HomePresenterDelegate? { get set }
    
//    func viewDidLoad()
    func setupTrackInfo(track: MediaRemoteTrackInfo)
}

protocol HomePresenterDelegate: AnyObject {
    var interactor: HomeInteractorDelegate? { get set }
    func viewDidLoad()
}

protocol HomeInteractorDelegate: AnyObject {
    func getCurrentTrack(action: Selector)
}

