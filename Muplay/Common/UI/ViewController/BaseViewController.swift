//
//  BaseViewController.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa
import SnapKit
class BaseViewController: NSViewController {
    
    private var bgColor: CGColor? 

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.wantsLayer = true
//        view.layer?.backgroundColor = bgColor
        view.layer?.cornerRadius = 20
    }
    
    func setupBackgroundColor(color: CGColor = NSColor.white.withAlphaComponent(0.2).cgColor) {
        bgColor = color
        view.layer?.backgroundColor = bgColor
    }
    
}
