//
//  DetailScreenView.swift
//  Crypto
//
//  Created by Developer on 06.12.2022.
//

import SwiftUI

struct DetailScreenView: View {
    
    @ObservedObject var viewModel = DetailViewModelImpl(coins: .init(id: "", name: "", price: 1.1, imageURL: ""), detailService: DetailServiceImpl(executor: NetworkRequestExecutor()))
    
    var body: some View {
        ZStack {
            Color.mainColor.opacity(0.9)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    if viewModel.customError {
                        ErrorView()
                    } else {
                        detailView
                    }
                }
            }
            .createToolBarDetailView(
                text: String(viewModel.coins.name),
                dismissAction: {
                    viewModel.onBackPresed()
                }
            )
        }.onAppear() {
            viewModel.getDetails()
        }
    }
}

private extension DetailScreenView {
    
    var detailView: some View {
        VStack {
            if viewModel.isLoading {
                DetailLoadingView()
            } else {
                GraphView(viewModel: viewModel.graphViewModel);
                main
                Spacer()
                createMainButton(text: "buy".localizedWithVars(vars: viewModel.coins.name), action: {})
            }
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
                Text("$" + (viewModel.coins.price).toString())
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
        }
    }
    
    func createNewsRow(newsModel: Details.News) -> some View {
        VStack {
            HStack {
                Text(newsModel.title)
                    .font(.system( size: 20, weight: .bold))
                    .foregroundColor(Color.white)
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Text("\(newsModel.date)".convertCoin(time: newsModel.date))
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
