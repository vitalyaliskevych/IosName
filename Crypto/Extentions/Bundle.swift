//
//  Bundle.swift
//  Crypto
//
//  Created by Developer on 25.01.2023.
//

import Foundation

extension Bundle {
    
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? String()
    }
}
