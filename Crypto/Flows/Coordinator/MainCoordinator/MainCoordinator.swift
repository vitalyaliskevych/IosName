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
        case navigationToSettingsScreen(coordinator: SettingsCoordinator)
        case navigationToDetailScreen(coordinator: DetailCoordinator)
    }
    
    @Published var route: Route?
    
    var mainViewModel: MainViewModel
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        mainViewModel.onResult = { [weak self] result in
            switch result {
            case .navigationToSettingsScreen:
                self?.navigationToSettingsView()
            case .navigationToDetailScreen(let coinName):
                self?.navigationToDetailScreen(coinName: coinName)
            }
        }
    }
    
    func navigationToSettingsView() {
        let settingsCoordinator = SettingsCoordinator(settingsViewModel: SettingsViewModel())
        settingsCoordinator.onResult = { result in
            switch result {
            case .navigationToMainScreen:
                self.route = nil
            }
        }
        route = .navigationToSettingsScreen(coordinator: settingsCoordinator)
    }
    
    func navigationToDetailScreen(coinName: Coin) {
        let detailCoordinator = DetailCoordinator(
            detailViewModel: DetailViewModel(
                coinName: Coin(
                    name: coinName.name,
                    price: 21188,
                    icon: Image.btcIcn
                )
            )
        )
        detailCoordinator.onResult = { result in
            switch result {
            case .navigationToMainScreen:
                self.route = nil
            }
        }
        route = .navigationToDetailScreen(coordinator: detailCoordinator)
    }
}
