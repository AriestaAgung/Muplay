// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let onlineLyricSearch = try? JSONDecoder().decode(OnlineLyricSearch.self, from: jsonData)

import Foundation

// MARK: - OnlineLyricSearch
struct OnlineLyricSearch: Codable {
    let success: Bool?
    let message: String?
    let results: LyricResults?
}

// MARK: - Results
struct LyricResults: Codable {
    let maxCollapsedLines: Int?
    let footer: Desc?
    let maxExpandedLines: Int?
    let description: Desc?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case maxCollapsedLines = "max_collapsed_lines"
        case footer
        case maxExpandedLines = "max_expanded_lines"
        case description, type
    }
}

// MARK: - Description
struct Desc: Codable {
    let text: String?
    let runs: [LyricRun]?
}

// MARK: - Run
struct LyricRun: Codable {
    let italics: Bool?
    let text: String?
    let bold, strikethrough: Bool?
}
