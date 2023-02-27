//
//  MainViewModel.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import Foundation

class MainViewModel: ObservableObject {
    
    enum Result {
        case onSettingsSelected
        case onCoinItemSelected(coinName: Coin)
    }
    
    @Published var coins: [Coin] = []
    
    var onResult: ((Result) -> Void)?
    var coinService: CoinService
    
    init(coinService: CoinService) {
        self.coinService = coinService
    }
    
    func selectSettings() {
        onResult?(.onSettingsSelected)
    }
    
    func selectCoinItem(coinName: Coin) {
        onResult?(.onCoinItemSelected(coinName: coinName))
    }
    
    func onAppear() {
        self.coins = coinService.getCoins()
    }
}
