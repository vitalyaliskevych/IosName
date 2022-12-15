//
//  IntroView.swift
//  Crypto
//
//  Created by Developer on 14.11.2022.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        ZStack {
            Image.intro
                .resizable()
                .ignoresSafeArea()
            VStack {
                topText
                Spacer()
                bottomButton
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

private extension IntroView {
    var topText: some View {
        VStack(spacing: 10) {
            welcome
            welcome2
            }
        .padding(.top, 50)
    }
    var welcome: some View {
        Text("Welcome")
            .foregroundColor(Color.white)
            .font(.custom("Poppins-Bold", size: 40))
    }
    var welcome2: some View {
        Text("To the Crypto")
            .foregroundColor(Color.white)
            .font(.custom("Poppins-SemiBold", size: 30))
    }
    
    var bottomButton: some View {
            Button(action: {}) {
                Text("Let's start")
                    .foregroundColor(Color.white)
                    .frame(width: 330, height: 70)
                    .font(.custom("Poppins-SemiBold", size: 18))

        }
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
            .padding(.bottom, 10)
    }
}
