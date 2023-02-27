//
//  DetailScreenView.swift
//  Crypto
//
//  Created by Developer on 06.12.2022.
//

import SwiftUI

struct DetailScreenView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor.opacity(0.9)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        GraphView(viewModel: GraphViewModel(coinInfo: CoinService()))
                        detailView
                    }
                }
                .createToolBarDetailView(
                    text: String(viewModel.coinName.name),
                    dismissAction: {
                        viewModel.onBackPresed()
                    }
                )
            }
        }
    }
}

private extension DetailScreenView {
    var detailView: some View {
        VStack {
            main
            Spacer()
                createMainButton(text: "buy".localizedWithVars(vars: viewModel.coinName.name), action: {})
        }
    }
    
    var main: some View {
        VStack(spacing: 15) {
            coinPrice
            news
        }
    }
    
    var coinPrice: some View {
        HStack {
            HStack {
                Text("$" + (viewModel.coinName.price).toString())
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
            ForEach(viewModel.news, id: \.id) { news in
                createNewsRow(newsModel: news)
            }
        } .onAppear() {
            viewModel.onAppear()
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
    
    var createDivider: some View {
        Divider()
            .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
            .background(Color.gray)
    }
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(viewModel: .init(coinName: Coin(name: "Bitcoin", price: 1651.64, icon: Image.btcIcn), newsService: NewsService()))
    }
}
