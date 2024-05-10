// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let onlineMusicSearch = try? JSONDecoder().decode(OnlineMusicSearch.self, from: jsonData)

import Foundation

// MARK: - OnlineMusicSearch
struct OnlineMusicSearch: Codable {
    let result: [MusicResult]?
    let nextPageToken: String?
}

// MARK: - Result
struct MusicResult: Codable {
    let videoID, title: String?
    let thumbnail: String?
    let author: String?
    let duration: String?
    let isExplicit: Bool?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case title, thumbnail, author, duration, isExplicit
    }
}

