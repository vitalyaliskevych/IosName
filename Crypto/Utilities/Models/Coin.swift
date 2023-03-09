//
//  Coin.swift
//  Crypto
//
//  Created by Developer on 14.12.2022.
//

import SwiftUI

struct Coins {
    let coins: [Coin]
    struct Coin: Identifiable {
        
        let id: String
        let name: String
        let price: Double
        let imageURL: String
    }
}



