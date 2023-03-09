//
//  DetailScreenViewModel.swift
//  Crypto
//
//  Created by Developer on 15.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    enum Result {
        case onNavigateBack
    }
    
    @Published var detailsNews = [News]()
    @Published var customError = false
    @Published var isLoading = true
    @Published var news: [News] = []
    
    var onResult: ((Result) -> Void)?
    var coinName: Coins.Coin
    var newsService: NewsService
    
    init(coinName: Coins.Coin, newsService: NewsService) {
        self.coinName = coinName
        self.newsService = newsService
    }
    
    func onBackPresed() {
        onResult?(.onNavigateBack)
    }
    
    func onAppear() {
        self.news = newsService.getNews()
    }
}
