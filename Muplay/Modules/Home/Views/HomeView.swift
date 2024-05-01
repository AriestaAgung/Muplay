//
//  HomeView.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class HomeView: BaseViewController, HomeViewDelegate {
    var presenter: (any HomePresenterDelegate)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.cornerRadius = 20
        view.layer?.backgroundColor = NSColor.systemPink.cgColor
        
    }
    
}
