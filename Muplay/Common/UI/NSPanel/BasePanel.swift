//
//  BasePanel.swift
//  Muplay
//
//  Created by Ariesta APP on 02/05/24.
//

import Cocoa
import AppKit
class BasePanel: NSPanel {
    init(windowTitle: CommonConstant, _ view: NSViewController) {
        super.init(
            contentRect: NSMakeRect(0, 0,  NSScreen.main!.frame.width/2, NSScreen.main!.frame.height/2),
            styleMask: [.resizable,.miniaturizable,.closable, .titled, .unifiedTitleAndToolbar, .borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: true
        )
        isOpaque = false
        hasShadow = false
        backgroundColor = .clear
        titlebarAppearsTransparent = true
        isMovable = true
        isMovableByWindowBackground = true
        title = windowTitle.rawValue
        titlebarSeparatorStyle = .none
        if let screenFrame = NSScreen.main?.frame {
            setFrame(screenFrame, display: true)
        }
        contentViewController = view
        collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        orderFrontRegardless()
        level = .mainMenu
    }
}
