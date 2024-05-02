//
//  AppDelegate.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

    private var panel: BasePanel?
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        app.mainMenu = AppMenu()
        panel = BasePanel(windowTitle: .emptyString, HomeConfigurator.shared.createHomeModule())
        panel?.center()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

