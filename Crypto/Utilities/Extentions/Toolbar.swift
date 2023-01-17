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
    
    func createToolBarSettingsView(text: String, dismissAction: (() -> Void)?) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismissAction?()
                }, label: {
                    Text("X")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                })
            }
            ToolbarItem(placement: .principal) {
                Text(text)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
        })
    }
}
