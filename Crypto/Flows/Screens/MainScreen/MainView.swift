//
//  MainView.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel : MainViewModel
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    ScrollView {
                        coinList
                            .listRowBackground(Color.mainColor)
                    }
                    .scrollContentBackground(.hidden)
                    settingsBlock
                    Spacer()
                }
                .background(Color.mainColor)
                .createToolbarMainView(text: "Crypto")
            }
        }
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(viewModel: .init())
        }
    }
}

private extension MainView {
    
    var coinList: some View {
        VStack {
            VStack(spacing: 10) {
                ForEach(viewModel.coinModels, id: \.id) { coinModel in
                    createButton(
                        coinModel: coinModel,
                        action: {
                            viewModel.selectCoinItem(
                                coinName: coinModel
                            )
                        }
                    )
                        .background(Color.bottomButtonColor)
                        .cornerRadius(15)
                        .padding([.leading,.trailing], 20)
                }
                .padding(.bottom, 15)
            }
            Spacer()
    
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
    
    func createButton(coinModel: Coin, action: (() -> Void)?) -> some View {
        VStack {
            VStack {
                Button(action: {
                    action?()
                }) {
                    HStack {
                        coinModel.icon
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                        Text(coinModel.name)
                            .font(.system( size: 18, weight: .bold))
                            
                            .foregroundColor(Color.white)
                            .padding()
                        Spacer()
                        Text("$" + String(format:"%.2f", coinModel.price))
                            .frame(height: 30)
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
}


