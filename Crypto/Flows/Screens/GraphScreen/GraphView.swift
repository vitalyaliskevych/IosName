//
//  GraphView.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import SwiftUI

struct GraphView: View {
    
    @ObservedObject var viewModel: GraphViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .bottom, spacing: 26) {
                    ForEach(viewModel.priceInfoViewModels) { priceInfoViewModel in
                        Rectangle()
                            .foregroundColor(priceInfoViewModel.color)
                            .frame(width: 35, height: (Double(viewModel.fullBarHeight) / viewModel.maxValue) * priceInfoViewModel.price)
                            .cornerRadius(.infinity)
                    }
                }
                createDivider
                
                HStack(spacing: 9) {
                    ForEach(viewModel.priceInfoViewModels) { val in
                        Text(val.day)
                    }
                    .frame(width: 50, height: 30)
                }
            }
        }
    }
}

private extension GraphView {
    var createDivider: some View {
        Color.gray
            .cornerRadius(.infinity)
            .frame(width: 310, height: 5)
            
    }
}

struct GraphView_Previews: PreviewProvider {
    
    static let coinInfo: [PriceInfo] = [
        PriceInfo(price: 90.4, day: "01.11"),
        PriceInfo(price: 81.0, day: "02.11"),
        PriceInfo(price: 96.4, day: "03.11"),
        PriceInfo(price: 66.4, day: "04.11"),
        PriceInfo(price: 96.4, day: "05.11")
    ]
    
    static var previews: some View {
        GraphView(viewModel: .init(coinInfo: coinInfo))
    }
}



