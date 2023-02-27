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
}
