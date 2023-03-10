//
//  MainViewModel.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import Foundation
import Combine
import SwiftUI

class MainViewModel: ObservableObject {
    
    enum Result {
        case onSettingsSelected
        case onCoinItemSelected(coinName: Coins.Coin)
    }
    
    @Published var coins = [Coins.Coin]()
    @Published var output = String()
    @Published var loading = false
    
    var onResult: ((Result) -> Void)?
    
    func selectSettings() {
        onResult?(.onSettingsSelected)
    }
    
    func selectCoinItem(coinName: Coins.Coin) {
        onResult?(.onCoinItemSelected(coinName: coinName))
    }
    
    func onButtonTupped() {}
}

class MainViewModelImpl: MainViewModel {
    
    private let coinService: CoinService
    private var cancellables = Set<AnyCancellable>()
    
    init(coinService: CoinService) {
        self.coinService = coinService
    }
    
    func getCoins() {
        self.loading = true
        coinService
            .getCoins()
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.output = error.localizedDescription
                self?.loading = false
            } receiveValue: { [weak self] coinsValue in
                self?.coins = coinsValue.coins
                self?.loading = false
            }
            .store(in: &cancellables)
    }
}
