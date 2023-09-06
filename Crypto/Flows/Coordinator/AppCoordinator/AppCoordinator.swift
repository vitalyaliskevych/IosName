//
//  AppCoordinator.swift
//  Crypto
//
//  Created by Developer on 22.02.2023.
//

import Foundation

class AppCoordinator: ObservableObject {
    
    enum Route {
        case onMainSelected
        case onIntroSelected
    }
    
    @Published var route: Route?
    
    var mainCoordinator: MainCoordinator
    var introViewModel: IntroViewModel
    
    init(
        userDefaults: UserDefaultsManager,
        introViewModel: IntroViewModel,
        mainCoordinator: MainCoordinator
    ) {
        self.mainCoordinator = mainCoordinator
        self.introViewModel = introViewModel
        introViewModel.onResult = { [weak self] result in
            switch result {
            case .onMainSelected:
                self?.route = .onMainSelected
            }
        }
        if  userDefaults.isIntroCompleted {
            route = .onMainSelected
        } else {
            route = .onIntroSelected
        }
    }
}
