//
//  BasePanel.swift
//  Muplay
//
//  Created by Ariesta APP on 02/05/24.
//

import Cocoa
import AppKit


/// Panel is to create floating window on every fullscreen apps / spaces
class BasePanel: NSPanel {
    /// Custom Init for base panel
    /// - Parameters:
    ///   - windowTitle: Window title for every window showed with the title on CommonConstant
    ///   - view: Base View Controller for the panel
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
