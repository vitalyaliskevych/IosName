//
//  IntroViewModel.swift
//  Crypto
//
//  Created by Developer on 14.11.2022.
//

import Foundation
import SwiftUI

class IntroViewModel: ObservableObject {
    
    enum Result {
        case onMainSelected
    }
    
    @Published var titleIsShown = false
    @Published var buttonIsShown = false
    
    var onResult: ((Result) -> Void)?
    var coin = Coin(name: "", price: 1.2, icon: Image.btcIcn)
    var userDefaultsManager: UserDefaultsManager
    
    init(userDefaultsManager: UserDefaultsManager) {
        self.userDefaultsManager = userDefaultsManager
    }
    
    func onStartButtonPressed() {
        onResult?(.onMainSelected)
        userDefaultsManager.isIntroCompleted = true
    }
}
