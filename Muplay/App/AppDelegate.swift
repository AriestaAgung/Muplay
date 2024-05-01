//
//  AppDelegate.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    private let newWindow = BaseTransparentWindow(
        contentRect: NSMakeRect(0, 0, NSScreen.main!.frame.width/2, NSScreen.main!.frame.height/2),
        styleMask: [.resizable,.miniaturizable,.closable, .fullSizeContentView, .borderless, .unifiedTitleAndToolbar],
        backing: .buffered,
        defer: true
    )
    private var windowController: NSWindowController?
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        newWindow.contentViewController = HomeConfigurator.shared.createHomeModule()
        newWindow.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

