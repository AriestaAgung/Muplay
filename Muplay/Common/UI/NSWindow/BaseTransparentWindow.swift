//
//  BaseTransparentWindow.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class BaseTransparentWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        isOpaque = true
        hasShadow = true
        backgroundColor = .blue
        titlebarAppearsTransparent = false
        isMovable = true
        isMovableByWindowBackground = true
        
        if let screenFrame = NSScreen.main?.frame {
            setFrame(screenFrame, display: true)
        }
    }
}
