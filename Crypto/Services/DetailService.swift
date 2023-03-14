//
//  NewsService.swift
//  Crypto
//
//  Created by Developer on 26.02.2023.
//

import SwiftUI
import Combine

protocol DetailService {
    
    func getDetails(id: String) -> AnyPublisher<Details, Error>
}

final class DetailServiceImpl: DetailService {
    
    let executor: NetworkRequestExecutor
    
    init(executor: NetworkRequestExecutor) {
        self.executor = executor
    }
    
    func getDetails(id: String) -> AnyPublisher<Details, Error> {
        func request() -> AnyPublisher<DetailsDTO, Error> {
            return executor
                .performRequest(
                    path: "/getDetails.php?id=",
                    method: .get
                )
        }
        
        return request()
            .map { detailsDTO in
                detailsDTO.toDomainModel()
            }
            .eraseToAnyPublisher()
    }
}
