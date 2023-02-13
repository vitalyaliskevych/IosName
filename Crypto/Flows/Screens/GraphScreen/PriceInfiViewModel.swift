//
//  PriceInfiViewModel.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import Foundation
import SwiftUI

class PriceInfoViewModel: ObservableObject, Identifiable {

    let price: Double
    let day: String
    let color: Color

    init(price: Double, day: String, color: Color) {
        self.price = price
        self.day = day
        self.color = color
    }
}
