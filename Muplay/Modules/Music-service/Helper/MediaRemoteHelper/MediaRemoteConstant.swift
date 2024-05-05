//
//  MediaRemoteConstant.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation
struct MediaRemoteConstant {
    //MARK: NotificationCenter Name
    struct Notification {
        static let musicChangedNotification: NSNotification.Name = NSNotification.Name(rawValue: "MusicChanged")
        static let musicPlayedNotification: NSNotification.Name = NSNotification.Name(rawValue: "MusicPlayed")
        static let musicStoppedNotification: NSNotification.Name = NSNotification.Name(rawValue: "MusicStopped")
        static let musicPausedNotification: NSNotification.Name = NSNotification.Name(rawValue: "MusicPaused")
        static let postTrackName = "trackInfo"
    }
}
