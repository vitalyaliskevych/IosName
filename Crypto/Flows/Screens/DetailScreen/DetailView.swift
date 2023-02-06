//
//  DetailScreenView.swift
//  Crypto
//
//  Created by Developer on 06.12.2022.
//

import SwiftUI

struct DetailScreenView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var coinName: Coin
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor.opacity(0.9)
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        main
                    }
                    createBuyCoinButton(text: "buy" + String(" " + coinName.name), action: {})
                }
                .createToolBarDetailView(
                    text: String(coinName.name),
                    dismissAction: {}
                )
            }
        }
    }
}

private extension DetailScreenView {
    var main: some View {
        VStack(spacing: 15) {
            coinPrice
            news
        }
    }
    var coinPrice: some View {
        HStack {
            HStack {
                Text("$" + String(format:"%.2f", coinName.price))
                    .font(.system(size: 16))
                    .foregroundColor(.red)
            }
            .frame(width: 74, height: 24)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.2))
            .cornerRadius(15)
            Spacer()
        }
        .padding()
    }
    
    var news: some View {
        VStack {
            HStack {
                Text("news".localized)
                    .foregroundColor(Color.white)
                    .font(.system( size: 26, weight: .bold))
                    .padding()
                Spacer()
            }
            ForEach(viewModel.newsModels, id: \.id) { newsModel in
                createNewsRow(newsModel: newsModel)
            }
        }
    }
    
    func createNewsRow(newsModel: News) -> some View {
        VStack {
            HStack {
                Text(newsModel.newsId)
                    .font(.system( size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Text(newsModel.newsDate)
                    .font(.system( size: 18, weight: .medium))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding(.leading, 20)
                Spacer()
            }
            createDivider
        }
        .padding(.top, 20)
    }
    
    func createBuyCoinButton(text: String, action: (() -> Void)?) -> some View {
        VStack {
            Button(action: {action?()}) {
                HStack {
                    Text(text)
                        .font(.system( size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .frame(width: 330)
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
        }
    }
    
    var createDivider: some View {
        Divider()
            .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
            .background(Color.gray)
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(viewModel: DetailViewModel(), coinName: .init(name: "Bitcoin", price: 1651.64, icon: Image.btcIcn))
    }
}
