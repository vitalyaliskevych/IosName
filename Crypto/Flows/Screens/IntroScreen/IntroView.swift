//
//  IntroView.swift
//  Crypto
//
//  Created by Developer on 14.11.2022.
//

import SwiftUI

struct IntroView: View {
    
    @ObservedObject var viewModel: IntroViewModel
    
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
        IntroView(viewModel: .init())
    }
}

private extension IntroView {
    var topText: some View {
        VStack(spacing: 10) {
            welcome
            welcome2
        }
        .padding(.top, 50)
        .opacity(viewModel.animation ? 1.0 : 0.0)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    viewModel.animation.toggle()
                }
            }
        }

    }
    var welcome: some View {
        Text("Welcome")
            .foregroundColor(Color.white)
            .font(.system( size: 40, weight: .bold))
    }
    var welcome2: some View {
        Text("To the Crypto")
            .foregroundColor(Color.white)
            .font(.system( size: 30, weight: .bold))
    }
    
    var bottomButton: some View {
        Button(
            action: {
                viewModel.selectMainView(coinModels: viewModel.coin)
            }
        ){
                Text("Let's start")
                    .foregroundColor(Color.white)
                    .frame(width: 330, height: 70)
                    .font(.system( size: 18, weight: .bold))

        }
        .background(Color.bottomButtonColor)
        .cornerRadius(15)
        .padding(.bottom, 10)
        .opacity(viewModel.animationButton ? 1.0 : 0.0)
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 2.0)) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.animationButton.toggle()
                }
            }
        }
    }
}
