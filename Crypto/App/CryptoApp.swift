//
//  CryptoApp.swift
//  Crypto
//
//  Created by Developer on 14.11.2022.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(coordinator: MainCoordinator(mainViewModel: MainViewModel()))
        }
    }
}
