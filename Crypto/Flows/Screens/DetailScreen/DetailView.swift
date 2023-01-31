//
//  DetailScreenView.swift
//  Crypto
//
//  Created by Developer on 06.12.2022.
//

import SwiftUI

struct DetailScreenView: View {
    @ObservedObject var viewModel = DetailViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                Color.mainColor.opacity(0.9)
                    .ignoresSafeArea()
                VStack {
                    ScrollView {
                        main
                    }
                    createButton(text: "Buy Bitcoin", dismissAction: {})
                }
                .createToolBarDetailView(
                    image: "chevron.left",
                    text: "Bitcoin",
                    dismissAction: {}
                )
            }
        }
    }
}

private extension DetailScreenView {
    var main: some View {
        VStack(spacing: 15) {
            bitcoinPrice
            news
        }
    }
    var bitcoinPrice: some View {
        HStack {
            HStack {
                Text("$1,651,54")
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
                Text("News")
                    .foregroundColor(Color.white)
                    .font(.system( size: 26, weight: .bold))
                    .padding()
                Spacer()
            }
            ForEach(viewModel.newsModels, id: \.id) { newsModel in
                createToNews(newsModel: newsModel)
            }
        }
    }
    
    func createToNews(newsModel: News) -> some View {
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
            Divider()
                .frame( width: UIScreen.main.bounds.width / 1.1, height: 1)
                .background(Color.gray)
        }
        .padding(.top, 20)
        
    }
    
    func createButton(text: String, dismissAction: (() -> Void)?) -> some View {
        VStack {
            Button(action: {
                dismissAction?()
                }) {
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
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView()
    }
}
