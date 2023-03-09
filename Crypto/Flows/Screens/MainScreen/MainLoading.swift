//
//  MainLoading.swift
//  Crypto
//
//  Created by Developer on 24.02.2023.
//

import SwiftUI

struct MainLoadingView: View {
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    coinList
                        .listRowBackground(Color.mainColor)
                }
                settingsBlock
            }
            .background(Color.mainColor)
            .createToolbarMainView(text: "Crypto").navigationBarTitleDisplayMode(.inline)
        }
    }
}

private extension MainLoadingView {
    
    var coinList: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(0...5, id: \.self) { _ in
                    createButton()
                }
                .background(Color.bottomButtonColor)
                .cornerRadius(15)
                .padding([.leading,.trailing], 20)
            }
            .padding(.bottom, 15)
        }
    }
}

var settingsBlock: some View {
    HStack {
        Spacer()
        Button(action: {}) {
            HStack {
                Image.stgIcn
            }
            .foregroundColor(Color.white)
            .frame(width: 70, height: 70)
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
        }
        .padding([.bottom, .trailing], 15)
    }
}

func createButton() -> some View {
    VStack {
        Button(action: {}) {
            HStack {
                ShimmerView()
                    .frame(width: 30, height: 30)
                    .cornerRadius(.infinity)
                Spacer()
                Text("")
                ShimmerView()
                    .frame(height: 30)
                    .cornerRadius(.infinity)
            }
            .cornerRadius(15)
            .padding([.leading,.trailing], 20)
        }
        .frame(height: 70)
    }
}


//struct MainLoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainLoadingView(viewModel: .init(coinService: CoinServiceImpl(executor: NetworkRequestExecutor())))
//    }
//}
