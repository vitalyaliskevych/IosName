//
//  CoinService.swift
//  Crypto
//
//  Created by Developer on 25.02.2023.
//

import Foundation
import SwiftUI
import Combine

protocol CoinService {
    func getCoins() -> AnyPublisher<Coins, Error>
}

final class CoinServiceImpl: CoinService {
    
    let executor: NetworkRequestExecutor
    
    init(executor: NetworkRequestExecutor) {
        self.executor = executor
    }
    
    func getCoins() -> AnyPublisher<Coins, Error> {
        func request() -> AnyPublisher<CoinsDTO, Error> {
            return executor
                .performRequest(
                    path: "/getCoins.php",
                    method: .get
                )
        }
        
        return request()
            .map { coinsDTO in
                coinsDTO.toDomainModel()
            }
            .eraseToAnyPublisher()
    }
    
    func getCoinInfo() -> [PriceInfo] {
        return [
            PriceInfo(price: 90.4, day: "01.11"),
            PriceInfo(price: 81.0, day: "02.11"),
            PriceInfo(price: 96.4, day: "03.11"),
            PriceInfo(price: 66.4, day: "04.11"),
            PriceInfo(price: 96.4, day: "05.11")
        ]
    }
}
