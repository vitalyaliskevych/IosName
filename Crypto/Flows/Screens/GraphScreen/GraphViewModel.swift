//
//  GraphViewModel.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import Foundation
import SwiftUI

class GraphViewModel: ObservableObject {

    var maxValue: Double = 100
    var fullBarHeight: Double = 250
    @Published var priceInfoViewModels: [PriceInfoViewModel] = []

    init(coinInfo: [PriceInfo]) {
        priceInfoViewModels = coinInfo.enumerated().map { (index, priceInfo) in
            return PriceInfoViewModel (
                price: priceInfo.price,
                day: priceInfo.day,
                color: coinInfo.getColor(index: index)
            )
        }
    }
}
