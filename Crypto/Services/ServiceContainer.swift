//
//  ServiceContainer.swift
//  Crypto
//
//  Created by Developer on 27.02.2023.
//

import Foundation

class ServiceContainer {
    
    static let shared = ServiceContainer()
    
    lazy var userService = UserServiceImpl(executor: NetworkRequestExecutor())
    lazy var coinService = CoinServiceImpl(executor: NetworkRequestExecutor())
    lazy var detailService = DetailServiceImpl(executor: NetworkRequestExecutor())
}
