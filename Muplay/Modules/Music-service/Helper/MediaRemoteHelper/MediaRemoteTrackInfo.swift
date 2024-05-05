//
//  MediaRemoteTrack.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

struct MediaRemoteTrackInfo: Codable, Equatable {
    let name: String?
    let artist: String?
    let artwork: Data?
    let elapsedTime: Double?
    let playing: Bool
}
