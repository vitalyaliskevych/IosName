//
//  DetailScreenViewModel.swift
//  Crypto
//
//  Created by Developer on 15.12.2022.
//

import Foundation
import SwiftUI
import Combine

class DetailViewModel: ObservableObject {
    
    enum Result {
        case onNavigateBack
    }
    
    @Published var periodPrices = [Details.PeriodPrices]()
    @Published var customError = false
    @Published var output = String()
    @Published var isLoading = false
    @Published var news = [Details.News]()
    
    var onResult: ((Result) -> Void)?
    var coins: Coins.Coin
    let graphViewModel: GraphViewModel
    let detailService: DetailService
    let formatter = DateFormatter()
    
    init(coins: Coins.Coin, detailService: DetailService) {
        self.coins = coins
        self.detailService = detailService
        self.graphViewModel = GraphViewModel(periodPrices: [])
    }
    
    func onBackPresed() {
        onResult?(.onNavigateBack)
    }
    
    func openURL(url: String) {
          guard let url = URL(string: url) else { return }
          UIApplication.shared.open(url)
      }
}

class DetailViewModelImpl: DetailViewModel {
    
    private var cancellables = Set<AnyCancellable>()
    
    func getDetails() {
        self.isLoading = true
        detailService
            .getDetails(id: coins.id)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else { return }
                self?.output = error.localizedDescription
                self?.isLoading = false
            } receiveValue: { [weak self] detailValue in
                self?.news = detailValue.news
                self?.graphViewModel.periodPrices = detailValue.periodPrices
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.isLoading = false
                }
            }
            .store(in: &cancellables)
    }
}
