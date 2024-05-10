// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let onlineLyricSearch = try? JSONDecoder().decode(OnlineLyricSearch.self, from: jsonData)

import Foundation

// MARK: - OnlineLyricSearch
struct OnlineLyricSearch: Codable {
    let type: String?
    let description: Description?
    let maxCollapsedLines, maxExpandedLines: Int?
    let footer: Description?

    enum CodingKeys: String, CodingKey {
        case type, description
        case maxCollapsedLines = "max_collapsed_lines"
        case maxExpandedLines = "max_expanded_lines"
        case footer
    }
}

// MARK: - Description
struct Description: Codable {
    let text: String?
    let runs: [LyricsRun]?
}

// MARK: - Run
struct LyricsRun: Codable {
    let text: String?
    let bold, italics, strikethrough: Bool?
}
