//
//  Managers.swift
//  Crypto
//
//  Created by Developer on 24.02.2023.
//

import Foundation

class UserDefaultsManager {
    
    private let introShowingText = "intro_is_showing"
    var isIntroCompleted: Bool {
        get {
            UserDefaults.standard.bool(forKey: introShowingText)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: introShowingText)
        }
    }
}
