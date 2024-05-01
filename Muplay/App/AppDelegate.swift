//
//  AppDelegate.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

    private let newWindow = BaseTransparentWindow(windowTitle: .emptyString, HomeConfigurator.shared.createHomeModule())
    private var windowController: BaseWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        newWindow.center()
//        newWindow.contentView?.addSubview(HomeConfigurator.shared.createHomeModule().view)
        windowController = BaseWindowController(window: newWindow)
        
        windowController?.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

