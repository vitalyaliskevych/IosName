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
    @Published var loading = true
    
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
    
    func onButtonTapped() {
        coinService
            .getCoins()
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.output = error.localizedDescription
            } receiveValue: { [weak self] coinsValue in
                self?.coins = coinsValue.coins
            }
            .store(in: &cancellables)
    }
}

