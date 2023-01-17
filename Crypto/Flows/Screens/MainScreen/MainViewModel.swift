//
//  MainViewModel.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import Foundation

class MainViewModel: ObservableObject {
    let coinModels: [Coin] = [
        .init(name: "Bitcoin", price: 21188.04, icon: .btcIcn),
        .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
        .init(name: "Ethereum", price: 1651.64, icon: .ethIcn),
        .init(name: "Bitcoin", price: 21188, icon: .btcIcn),
        .init(name: "Litecoin", price: 68.06, icon: .ltcIcn),
        .init(name: "Ethereum", price: 1651, icon: .ethIcn),
    ]
}
