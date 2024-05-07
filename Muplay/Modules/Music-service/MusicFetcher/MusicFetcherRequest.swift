//
//  MusicFetcherRequest.swift
//  Muplay
//
//  Created by Ariesta APP on 05/05/24.
//

import Foundation

struct MusicFetcherRequest: Codable {
    var q: String?
    var shelf: String?
}

struct LyricFetcherRequest: Codable {
    var id: String?
}
