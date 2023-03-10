//
//  MainView.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModelImpl(coinService: CoinServiceImpl(executor: NetworkRequestExecutor()))
    
    var body: some View {
        ZStack {
            if viewModel.loading {
                MainLoadingView()
            } else {
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
        }.onAppear() {
            viewModel.getCoins()
        }
    }
}

private extension MainView {
    
    var coinList: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(viewModel.coins) { coins in
                    createButton(
                        coins: coins,
                        action: {
                            viewModel.selectCoinItem(
                                coinName: coins
                            )
                        }
                    )
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
            Button(action: {
                viewModel.selectSettings()
            }) {
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
    
    func createButton(coins: Coins.Coin, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {
                action?()
            }) {
                HStack {
                    AsyncImage(url: URL(string: coins.imageURL)) { image in
                        image.image?.resizable()
                    }
                    .foregroundColor(Color.white)
                    .frame(width: 30, height: 30)
                    Text(coins.name)
                        .font(.system( size: 18, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    Text("$" + String(format:"%.2f", coins.price))
                        .frame(height: 30)
                        .padding(.horizontal, 10)
                        .font(.system(size: 16, weight: .medium))
                        .background(Color.mainColor.opacity(0.8))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .cornerRadius(15)
                .padding([.leading,.trailing], 20)
            }
            .frame(height: 70)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModelImpl(coinService: CoinServiceImpl(executor: NetworkRequestExecutor())))
    }
}
