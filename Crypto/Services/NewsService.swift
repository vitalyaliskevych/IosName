//
//  NewsService.swift
//  Crypto
//
//  Created by Developer on 26.02.2023.
//

import SwiftUI

class NewsService: ObservableObject {
    
    func getNews() -> [News] {
        return [
            .init(newsId: "Binance Market Update", newsDate: "7h ago"),
            .init(newsId: "Binance Market Update", newsDate: "14h ago"),
            .init(newsId: "Binance Market Update", newsDate: "2d ago")
        ]
    }
}
