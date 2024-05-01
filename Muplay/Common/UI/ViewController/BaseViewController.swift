//
//  BaseViewController.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class BaseViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.orange.cgColor
        view.layer?.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
