//
//  Coin.swift
//  Crypto
//
//  Created by Developer on 14.12.2022.
//

import SwiftUI

struct Coin: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let icon: Image
}

