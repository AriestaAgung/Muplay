//
//  String+Extension.swift
//  Muplay
//
//  Created by Ariesta APP on 02/05/24.
//

import Foundation

extension String {
    static let emptyString = ""
    var htmlDecoded: String {
        let decodedString = self.replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&amp;", with: "&")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&nbsp;", with: " ")
            .replacingOccurrences(of: "&apos;", with: "'")
        // Add more HTML entities as needed
        return decodedString
    }
}
