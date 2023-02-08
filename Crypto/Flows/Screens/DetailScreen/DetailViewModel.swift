//
//  DetailScreenViewModel.swift
//  Crypto
//
//  Created by Developer on 15.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    var coinName: Coin
    init(coinName: Coin) {
        self.coinName = coinName
    }
    let newsModels: [News] = [
        .init(newsId: "Binance Market Update", newsDate: "7h ago"),
        .init(newsId: "Binance Market Update", newsDate: "14h ago"),
        .init(newsId: "Binance Market Update", newsDate: "2d ago")
    ]
    let coinModels: [Coin] = [
        .init(name: "Bitcoin", price: 21188.04, icon: .btcIcn),
        .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
        .init(name: "Ethereum", price: 1651.64, icon: .ethIcn),
        .init(name: "Bitcoin", price: 21188, icon: .btcIcn),
        .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
        .init(name: "Ethereum", price: 1651, icon: .ethIcn),
    ]

}
