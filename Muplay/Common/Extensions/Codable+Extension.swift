//
//  Codable+Extension.swift
//  Muplay
//
//  Created by Ariesta APP on 10/05/24.
//

import Foundation

extension Encodable {
    func convertCodableObjectToURLParams() -> String? {
        guard let jsonData = try? JSONEncoder().encode(self),
              let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
            return nil
        }
        
        var urlParams = ""
        
        for (key, value) in jsonObject {
            if let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
               let encodedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                if !urlParams.isEmpty {
                    urlParams += "&"
                }
                urlParams += "\(encodedKey)=\(encodedValue)"
            }
        }
        return urlParams
    }
}
