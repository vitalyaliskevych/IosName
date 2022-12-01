//
//  MainView.swift
//  Crypto
//
//  Created by Developer on 17.11.2022.
//

import SwiftUI

struct MainView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color.bottomButtonColor)
    }
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    
                    Spacer()
                    List {
                        topCoin
                            .listRowBackground(Color.mainColor)
                    }
                    .scrollContentBackground(.hidden)
                    stgBlock
                        .offset(x:140, y: 0)
                }
                .background(Color.mainColor)
                .navigationTitle("Crypto")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    
        }
       
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
    
}

extension MainView {
 
    var topCoin: some View {
        VStack(spacing: 10) {
            btcBlock
            ltcBlock
            ethBlock
            btcBlock
            ltcBlock
            ethBlock
            Spacer()
            
        }
    }
    var btcBlock: some View {
        Button(action: {}) {
            HStack() {
                Image.btcIcn
                Spacer()
                Text("Bitcoin")
            Spacer()
                Text("$21,128.12")
                        .frame(height: 40)
                          .clipped()
                          .background(Color.black)
                          .cornerRadius(10)
                          .foregroundColor(.white)
        }
            .foregroundColor(Color.white)
            .frame(width: 330, height: 70)
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
            .padding(.bottom, 10)
            .font(.system(size: 24))
    }
}
    var ltcBlock: some View {
        Button(action: {}) {
            HStack {
                Image.ltcIcn
                Spacer()
                Text("Litecoin")
                Spacer()
                Text("$68.06")
                        .frame(height: 40)
                          .clipped()
                          .background(Color.black)
                          .cornerRadius(10)
                          .foregroundColor(.white)
            }
        }
        .foregroundColor(Color.white)
        .frame(width: 330, height: 70)
        .background(Color.bottomButtonColor)
        .cornerRadius(15)
        .padding(.bottom, 10)
        .font(.system(size: 24))
    }
    
    var ethBlock: some View {
            Button(action: {}) {
                HStack {
                    Image.ethIcn
                    Spacer()
                Text("Ethereum")
                    Spacer()
                    Text("$1,651.6")
                            .frame(height: 40)
                              .clipped()
                              .background(Color.black)
                              .cornerRadius(10)
                              .foregroundColor(.white)
                  
            }
        }
        .foregroundColor(Color.white)
        .frame(width: 330, height: 70)
        .font(.system(size: 24))
        .background(Color.bottomButtonColor)
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
    var stgBlock: some View {
        Button(action: {}) {
            HStack {
                Image.stgIcn
            }
            .foregroundColor(Color.white)
            .frame(width: 70, height: 70)
            .font(.system(size: 27))
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
            .padding(.bottom, 10)

        }
    }
}

