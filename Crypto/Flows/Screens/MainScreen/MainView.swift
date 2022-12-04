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
            ZStack {
                VStack {
                    VStack {
                        
                        Spacer()
                        List {
                            topCoin
                                .listRowBackground(Color.mainColor)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    .background(Color.mainColor)
                    .navigationTitle("Crypto")
                    .navigationBarTitleDisplayMode(.inline)
                }
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
        VStack {
            VStack(spacing: 10) {
                //            btcBlock
                //            ltcBlock
                //            ethBlock
                //            btcBlock
                //            ltcBlock
                //            ethBlock
                btcBlock
                ltcBlock
                ethBlock
                btcBlock
                ltcBlock
                ethBlock
            }
            Spacer()
            stgBlock
        }
    }
    var ltcBlock: some View {
            VStack {
                createButton(imagName: Image.ltcIcn, text: "Litecoin", number: "$68.06")
            }
            .background(Color.bottomButtonColor)
            .cornerRadius(15)
        }

    }
    
    var ethBlock: some View {
        VStack {
            createButton(imagName: Image.ethIcn, text: "Ethereum", number: "$1,651.64")
        }
        .background(Color.bottomButtonColor.cornerRadius(15))
    }
    var btcBlock: some View {
        VStack {
            createButton(imagName: Image.btcIcn, text: "Bitcoin", number: "21,188.12")
        }
        .background(Color.bottomButtonColor)
        .cornerRadius(15)
    }
    
    var stgBlock: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                HStack {
                    Image.stgIcn
                }
                .foregroundColor(Color.white)
                .frame(width: 70, height: 70)
                .font(.system(size: 27))
                .background(Color.bottomButtonColor)
                .cornerRadius(15)
                
            }
        }
    }
    func createButton(imagName: Image, text: String, number: String) -> some View {
        VStack {
            VStack {
                Button(action: {}) {
                        HStack {
                            imagName
                            .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 30, height: 30)
                            Text("\(text)")
                                .font(.system(size: 27))
                                .foregroundColor(Color.white)
                                .padding()
                            Spacer()
                            Text("\(number)")
                                .frame(height: 40)
                                .background(Color.black)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            
                        }
                        .cornerRadius(15)
                        .padding([.leading,.trailing],20)

                }
            }
        }
    }


