//
//  CoinInfo.swift
//  Crypto
//
//  Created by Developer on 21.12.2022.
//

import SwiftUI

struct CoinInfo: Identifiable {
    var id = UUID()
    
    let price: Double
    let day: String
}
