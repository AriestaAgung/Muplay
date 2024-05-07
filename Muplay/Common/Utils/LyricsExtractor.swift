//
//  LyricsExtractor.swift
//  Muplay
//
//  Created by Ariesta APP on 05/05/24.
//

import Foundation

class LyricsExtractor {

    func fetchLyrics(from url: URL) async throws -> String? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let htmlString = String(data: data, encoding: .utf8) else {
                return nil
            }
            
            guard let lyrics = extractLyrics(from: htmlString) else {
                return nil
            }
            
            return lyrics
        } catch {
            throw error
        }
    }

    func extractLyrics(from html: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: "<div class=\"lyrics\">(.*?)</div>", options: .dotMatchesLineSeparators)
            let range = NSRange(html.startIndex..<html.endIndex, in: html)
            guard let match = regex.firstMatch(in: html, options: [], range: range) else {
                return nil
            }
            let lyricsRange = Range(match.range(at: 1), in: html)!
            var lyrics = html[lyricsRange].trimmingCharacters(in: .whitespacesAndNewlines)
            
            if lyrics.isEmpty {
                lyrics = ""
                let containerRegex = try NSRegularExpression(pattern: "<div class=\"Lyrics__Container\">(.*?)</div>", options: .dotMatchesLineSeparators)
                let containerMatches = containerRegex.matches(in: html, options: [], range: range)
                for containerMatch in containerMatches {
                    let containerRange = Range(containerMatch.range(at: 1), in: html)!
                    let snippet = html[containerRange].replacingOccurrences(of: "<br>", with: "\n").replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                    lyrics += snippet.htmlDecoded.trimmingCharacters(in: .whitespacesAndNewlines)
                    lyrics += "\n\n"
                }
            }
            
            if lyrics.isEmpty {
                return nil
            }
            
            return lyrics.trimmingCharacters(in: .whitespacesAndNewlines)
        } catch {
            return nil
        }
    }


    // Example usage
//    let url = URL(string: "your_url_here")!
//    do {
//        if let lyrics = try await fetchLyrics(from: url) {
//            print(lyrics)
//        } else {
//            print("Lyrics not found")
//        }
//    } catch {
//        print("Error fetching lyrics: \(error)")
//    }

}
