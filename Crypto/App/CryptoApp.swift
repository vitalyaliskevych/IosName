//
//  CryptoApp.swift
//  Crypto
//
//  Created by Developer on 14.11.2022.
//

import SwiftUI

@main
struct CryptoApp: App {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color.bottomButtonColor)
//            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//            UINavigationBar.appearance().shadowImage = UIImage()
        }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
