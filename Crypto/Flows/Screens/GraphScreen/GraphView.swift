//
//  GraphView.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var viewModel: GraphViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .bottom, spacing: 25) {
                    ForEach(viewModel.priceInfoViewModels, id: \.self) { priceInfoViewModels in
                        Rectangle()
                            .foregroundColor(priceInfoViewModels.color)
                            .frame(width: 35, height: (Double(viewModel.fullBarHeight) / viewModel.maxValue) * priceInfoViewModels.price / 250)
                            .cornerRadius(.infinity)
                    }
                }
                divider
                HStack(spacing: 9) {
                    ForEach(viewModel.priceInfoViewModels, id: \.self
                    ) { val in
                        Text(val.day)
                    }
                    .frame(width: 50, height: 30)
                    .foregroundColor(Color.white)
                    .background(Color.mainColor.opacity(0.5))
                    .cornerRadius(15)
                }
            }
            .frame(width: 330, height: 330)
            .background(Color.bottomButtonColor.opacity(0.9))
            .cornerRadius(15)
        }
    }
}

private extension GraphView {
    var divider: some View {
        Color.gray
            .cornerRadius(.infinity)
            .frame(width: 310, height: 5)
    }
}


struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(viewModel: GraphViewModel(periodPrices: .init()))
    }
}
