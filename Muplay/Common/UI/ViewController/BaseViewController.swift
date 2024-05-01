//
//  BaseViewController.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa
import SnapKit
class BaseViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.withAlphaComponent(0.2).cgColor
        view.layer?.cornerRadius = 20
    }
    
}
