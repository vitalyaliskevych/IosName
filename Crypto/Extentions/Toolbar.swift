//
//  Toolbar.swift
//  Crypto
//
//  Created by Developer on 11.01.2023.
//

import Foundation
import SwiftUI

extension View {
    func createToolbarMainView(text: String) -> some View {
            self.toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(text)
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                }
            })
        }
}
