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
        case onMainSelected(coinModels: Coin)
    }
    
    @Published var animation = false
    @Published var animationButton = false
    
    var onResult: ((Result) -> Void)?
    var coin = Coin(name: "", price: 1.2, icon: Image.btcIcn)
    
    func selectMainView(coinModels: Coin) {
        onResult?(.onMainSelected(coinModels: coinModels))
    }
}
