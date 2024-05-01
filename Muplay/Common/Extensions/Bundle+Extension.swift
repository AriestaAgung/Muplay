//
//  Bundle+Extension.swift
//  Muplay
//
//  Created by Ariesta APP on 01/05/24.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
