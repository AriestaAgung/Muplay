//
//  BaseWindowController.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class BaseWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        window?.isOpaque = false
        window?.titlebarAppearsTransparent = true
    }

}
