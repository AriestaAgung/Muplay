//
//  MediRemoteHelper.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

private let bundle = CFBundleCreate(
    kCFAllocatorDefault,
    NSURL(fileURLWithPath: "/System/Library/PrivateFrameworks/MediaRemote.framework")
)

class MediaRemoteHelper {
    static let shared = MediaRemoteHelper()
    private var prevTrackInfo: MediaRemoteTrackInfo?
    private var currentTrackInfo: MediaRemoteTrackInfo?
    private var postTrackObject: [String: MediaRemoteTrackInfo?]?
    private var debounceTimer: Timer?
    
    let encoder: JSONEncoder = JSONEncoder()
    
    func run() {
        self.encoder.outputFormatting = .sortedKeys
        self.printNowPlayingInfo()
        self.registerNotificationObservers()
    }
    
    private func registerNotificationObservers() {
        // Get a Swift function for MRMediaRemoteRegisterForNowPlayingNotifications.
        guard let registerForNotificationsPointer = CFBundleGetFunctionPointerForName(
            bundle, "MRMediaRemoteRegisterForNowPlayingNotifications" as CFString
        ) else { return }
        typealias RegisterForNotificationsFunction = @convention(c) (
            DispatchQueue
        ) -> Void
        let registerForNowPlayingNotifications = unsafeBitCast(
            registerForNotificationsPointer,
            to: RegisterForNotificationsFunction.self
        )
        
        // Register for "Now Playing" notifications.
        registerForNowPlayingNotifications(DispatchQueue.main)
        
        DispatchQueue.main.async {
            // Handle NowPlayingApplicationIsPlayingDidChange events.
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.printNowPlayingInfo),
                name: NSNotification.Name(
                    "kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification"),
                object: nil
            )
            
            // Handle NowPlayingInfoDidChange events.
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.printNowPlayingInfo),
                name: NSNotification.Name("kMRMediaRemoteNowPlayingInfoDidChangeNotification"), 
                object: nil
            )
        }
    }
    
    @objc private func printNowPlayingInfo() {
        self.debounceTimer?.invalidate()
        self.debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            // Get a Swift function for MRMediaRemoteGetNowPlayingInfo.
            guard let MRMediaRemoteGetNowPlayingInfoPointer = CFBundleGetFunctionPointerForName(
                bundle,
                "MRMediaRemoteGetNowPlayingInfo" as CFString
            ) else { return }
            typealias MRMediaRemoteGetNowPlayingInfoFunction = @convention(c) (
                DispatchQueue, @escaping ([String: Any]) -> Void
            ) -> Void
            let MRMediaRemoteGetNowPlayingInfo = unsafeBitCast(
                MRMediaRemoteGetNowPlayingInfoPointer, 
                to: MRMediaRemoteGetNowPlayingInfoFunction.self
            )
            
            // Get song info.
            MRMediaRemoteGetNowPlayingInfo(
                DispatchQueue.main,
                { (information) in
                    var name: String?
                    var artist: String?
                    var playbackRate = 0.0
                    var artwork: Data?
                    var elapsedTime: Double?
                    
                    if information["kMRMediaRemoteNowPlayingInfoArtist"] != nil {
                        if let info = information["kMRMediaRemoteNowPlayingInfoArtist"] as? String {
                            artist = info
                        }
                        if let info = information["kMRMediaRemoteNowPlayingInfoTitle"] as? String {
                            name = info
                        }
                        if let info = information["kMRMediaRemoteNowPlayingInfoPlaybackRate"] as? Double {
                            playbackRate = info
                        }
                        if let info = information["kMRMediaRemoteNowPlayingInfoArtworkData"] as? Data {
                            artwork = info
                        }
                        if let info = information["kMRMediaRemoteNowPlayingInfoElapsedTime"] as? Double {
                            elapsedTime = info
                        }
                    }
                    
                    let trackInfo = MediaRemoteTrackInfo(
                        name: name,
                        artist: artist,
                        artwork: artwork,
                        elapsedTime: elapsedTime,
                        playing: playbackRate != 0.0
                    )
                    
                    if trackInfo != self.prevTrackInfo {
                        self.currentTrackInfo = trackInfo
                        fflush(stdout)
                        self.prevTrackInfo = trackInfo
                    }
                    self.postTrackObject = [MediaRemoteConstant.Notification.postTrackName:self.currentTrackInfo]
                    NotificationCenter.default.post(name: MediaRemoteConstant.Notification.musicChangedNotification, object: nil, userInfo: self.postTrackObject)
                }
            )
        }
    }
    func getCurrentTrackInfo() -> MediaRemoteTrackInfo? {
        return currentTrackInfo
    }
    func getLastTrackInfo() -> MediaRemoteTrackInfo? {
        return prevTrackInfo
    }
    
    func serializeTrackInfo(_ trackInfo: MediaRemoteTrackInfo) -> String {
        // Convert track info to a JSON string.
        do {
            let jsonData = try encoder.encode(trackInfo)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            return jsonString
        } catch {
            return "{\"error\": \"An error occurred while serializing JSON data.\")"
        }
    }
}
