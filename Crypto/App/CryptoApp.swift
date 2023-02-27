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
            NavigationView {
                AppCoordinatorView(coordinator: .init(userDefaults: UserDefaultsManager(), introViewModel: IntroViewModel(userDefaultsManager: UserDefaultsManager()), mainCoordinator: MainCoordinator(mainViewModel: MainViewModel(coinService: CoinService())))).navigationBarTitleDisplayMode(.inline)
//                MainLoadingView(viewModel: .init())
            }
        }
    }
}
