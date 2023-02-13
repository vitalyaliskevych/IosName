//
//  Array.swift
//  Crypto
//
//  Created by Developer on 13.02.2023.
//

import Foundation
import SwiftUI

extension Array where Element == PriceInfo {
    func getColor(index: Int) -> Color {
            guard index > 0 else {
                return Color.green
            }

            let prev = self[index - 1].price
            let current = self[index].price
            return (current >= prev) ? Color.green: Color.red
        }
    }
