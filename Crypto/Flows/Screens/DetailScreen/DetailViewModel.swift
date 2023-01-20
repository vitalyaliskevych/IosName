//
//  DetailScreenViewModel.swift
//  Crypto
//
//  Created by Developer on 15.12.2022.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    let newsModels: [News] = [
        .init(newsId: "Binance Market Update", newsDate: "7h ago"),
        .init(newsId: "Binance Market Update", newsDate: "14h ago"),
        .init(newsId: "Binance Market Update", newsDate: "2d ago")
    ]
}
