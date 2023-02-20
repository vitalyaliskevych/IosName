//
//  IntroNavigatorView.swift
//  Crypto
//
//  Created by Developer on 20.02.2023.
//

import Foundation
import SwiftUI

class IntroCoordinator: ObservableObject {
    
    enum Route {
        case onMainSelected(coordinator: MainCoordinator)
    }
    
    @Published var route: Route?
    
    var introViewModel: IntroViewModel
    
    init(introViewModel: IntroViewModel) {
        self.introViewModel = introViewModel
        introViewModel.onResult = { [weak self] result in
            switch result {
            case .onMainSelected(let coinModels):
                self?.selectMainView(coinModels: coinModels)
            }
        }
    }
    
    func selectMainView(coinModels: Coin) {
        let mainCoordinator = MainCoordinator(mainViewModel: MainViewModel())
        route = .onMainSelected(coordinator: mainCoordinator)
    }
}
