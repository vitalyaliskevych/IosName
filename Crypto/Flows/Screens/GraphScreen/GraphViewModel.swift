//
//  GraphViewModel.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import Foundation
import SwiftUI

class GraphViewModel: ObservableObject {
    
    
    @Published var periodPrices = [Details.PeriodPrices]()
    
    var priceInfoViewModels: [PriceInfoViewModel] {
        periodPrices.enumerated().map { (index, priceInfo) in
            return PriceInfoViewModel (
                price: priceInfo.price,
                day: priceInfo.date.convertGraph(time: priceInfo.date),
                color: periodPrices.getColor(index: index)
            )
        }
    }
    
    var fullBarHeight: Double = 250
    let maxValue: Double = 100
    
    init(periodPrices: [Details.PeriodPrices]) {
        self.periodPrices = periodPrices
    }
}
