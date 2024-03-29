//
//  SettingsViewModel.swift
//  Crypto
//
//  Created by Developer on 23.01.2023.
//

import Foundation


class SettingsViewModel: ObservableObject {
    
    @Published var isOn = false
    
    enum Result {
        case onNavigateBack
    }
    
    var onResult: ((Result) -> Void)?
    
    func onBackPressed() {
        onResult?(.onNavigateBack)
    }
}
