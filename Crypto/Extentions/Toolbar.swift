//
//  Toolbar.swift
//  Crypto
//
//  Created by Developer on 11.01.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func createToolBarSettingsView(image: String, text: String, dismissAction: (() -> Void)?) -> some View {
        self.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismissAction?()
                }, label: {
                    Image(systemName: image)
                        .foregroundColor(Color.white)
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

                    
    
