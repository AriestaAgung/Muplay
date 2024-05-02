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
    private var panel: BasePanel?
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        app.mainMenu = AppMenu()
        windowController = BaseWindowController(window: newWindow)
//        windowController?.window?.center()
//        windowController?.showWindow(self)
        panel = BasePanel(windowTitle: .emptyString, HomeConfigurator.shared.createHomeModule())
        panel?.center()
        panel?.windowController?.showWindow(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

