//
//  DomainModelConvertible.swift
//  Crypto
//
//  Created by Developer on 27.02.2023.
//

import Foundation

protocol DomainModelConvertible: Codable {
    associatedtype DomainModelType
    
    func toDomainModel() -> DomainModelType
}
