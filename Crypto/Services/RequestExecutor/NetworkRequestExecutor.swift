//
//  RequestExecutor.swift
//  Crypto
//
//  Created by Developer on 27.02.2023.
//

import Foundation
import Combine

class NetworkRequestExecutor {
    private let baseUrl = "https://crypto2211.000webhostapp.com"
    
    private func createRequest(for url: URL, method: HTTPMethod) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
}

extension NetworkRequestExecutor {
    
    func performRequest<T: Codable>(path: String, method: HTTPMethod) -> AnyPublisher<T, Error> {
        
        guard let url = URL(string: baseUrl + path) else {
            return Fail(error: RuntimeError("Wrong URL was provided"))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: createRequest(for: url, method: method))
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
