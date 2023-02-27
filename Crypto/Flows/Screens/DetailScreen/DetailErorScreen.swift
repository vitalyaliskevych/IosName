//
//  DetailErorScreen.swift
//  Crypto
//
//  Created by Developer on 24.02.2023.
//

import SwiftUI

struct DetailErorScreen: View {
    var body: some View {
        ZStack {
            Color.mainColor
                .ignoresSafeArea()
            VStack {
                detailEror
            }
        }
    }
}

private extension DetailErorScreen {
    
    var detailEror: some View {
        VStack(spacing: 20) {
            showImage
            text
            Spacer()
                .createMainButton(text: "Try again", action: {})
        }
    }
    
    var showImage: some View {
        Image.warningImg
            .resizable()
            .frame(width: 110, height: 100)
    }
    
    var text: some View {
        VStack(spacing: 20) {
            Text("error".localized)
                .font(.system(size: 18, weight: .bold))
                .bold()
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Text("try".localized)
                .font(.system(size: 18, weight: .bold))
                .bold()
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(10)
        }
        .frame(width: 300, alignment: .center)
    }
}

struct DetailErorScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailErorScreen()
    }
}
