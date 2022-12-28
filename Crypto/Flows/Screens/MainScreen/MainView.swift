//
//  MainView.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            VStack {
                titleView
                Spacer()
                List {
                    topCoin
                        .listRowBackground(Color.mainColor)
                }
                .scrollContentBackground(.hidden)
            }
            .background(Color.mainColor)
        }
        
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
    
}

private extension MainView {
    var titleView: some View {
        ZStack {
            Text("Crypto")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    var topCoin: some View {
        VStack {
            VStack(spacing: 10) {
                
                ForEach(viewModel.coinModels, id: \.id) { coinModel in
                    createButton(imageName: coinModel.icon, text: coinModel.name, number: "$\(coinModel.price)")
                        .background(Color.bottomButtonColor)
                        .cornerRadius(15)
                }
            }
            Spacer()
            settingsBlock
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
        }
    }
    func createButton(imageName: Image, text: String, number: String) -> some View {
        VStack {
            VStack {
                Button(action: {}) {
                    HStack {
                        imageName
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 30, height: 30)
                        Text("\(text)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.white)
                            .padding()
                        Spacer()
                        Text("\(number)")
                            .frame(height: 40)
                            .font(.system(size: 16, weight: .bold))
                            .background(Color.mainColor.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    }
                    .frame(height: 70)
                    .cornerRadius(15)
                    .padding([.leading,.trailing],20)
                    
                }
            }
        }
    }
}


