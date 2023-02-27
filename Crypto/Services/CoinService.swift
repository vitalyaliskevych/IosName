//
//  CoinService.swift
//  Crypto
//
//  Created by Developer on 25.02.2023.
//

import Foundation
import SwiftUI

class CoinService: ObservableObject {
    
    func getCoins() -> [Coin] {
        return [
            .init(name: "Bitcoin", price: 21188.04, icon: .btcIcn),
            .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
            .init(name: "Ethereum", price: 1651.64, icon: .ethIcn),
            .init(name: "Bitcoin", price: 21188, icon: .btcIcn),
            .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
            .init(name: "Ethereum", price: 1651, icon: .ethIcn),
        ]
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
