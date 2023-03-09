//
//  MainCoordinator.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import Foundation
import SwiftUI

class MainCoordinator: ObservableObject {
    
    enum Route {
        case onSettingsSelected(coordinator: SettingsCoordinator)
        case onCoinItemSelected(coordinator: DetailCoordinator)
    }
    
    @Published var route: Route?
    
    var mainViewModel: MainViewModelImpl
    
    
    init(mainViewModel: MainViewModelImpl) {
        self.mainViewModel = mainViewModel
        mainViewModel.onResult = { [weak self] result in
            switch result {
            case .onSettingsSelected:
                self?.selectSettings()
            case .onCoinItemSelected(let coinName):
                self?.selectCoin(coins: coinName)
            }
        }
    }
    
    func selectSettings() {
        let settingsCoordinator = SettingsCoordinator(
            settingsViewModel: SettingsViewModel()
        )
        settingsCoordinator.onResult = { result in
            switch result {
            case .onNavigateBack:
                self.route = nil
            }
        }
        route = .onSettingsSelected(coordinator: settingsCoordinator)
    }
    
    func selectCoin(coins: Coins.Coin) {
        let detailCoordinator = DetailCoordinator(
            detailViewModel: DetailViewModel(
                coinName: coins, newsService: NewsService()
            )
        )
        detailCoordinator.onResult = { result in
            switch result {
            case .onNavigateBack:
                self.route = nil
            }
        }
        route = .onCoinItemSelected(coordinator: detailCoordinator)
    }
}
