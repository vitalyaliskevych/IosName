//
//  Button.swift
//  Crypto
//
//  Created by Developer on 24.02.2023.
//

import Foundation
import SwiftUI

extension View {
    
    func createMainButton(text: String, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {action?()}) {
                Text(text)
                    .font(.system( size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    }
            .frame(width: 330, height: 70)
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
        }
    }
}
