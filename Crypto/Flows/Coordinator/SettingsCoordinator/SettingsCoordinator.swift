//
//  SettingsCoordinator.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import Foundation

class SettingsCoordinator: ObservableObject {
    
    enum Result {
        case onNavigateBack
    }
    
    var onResult: ((Result) -> Void)?
    var settingsViewModel: SettingsViewModel
    
    init(settingsViewModel: SettingsViewModel) {
        self.settingsViewModel = settingsViewModel
        settingsViewModel.onResult = { [weak self] result in
            switch result {
            case .onNavigateBack:
                self?.onResult?(.onNavigateBack)
            }
        }
    }
}
