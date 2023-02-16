//
//  DetailCoordinatorView.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct DetailCoordinatorView: View {
    
    @ObservedObject var coordinator: DetailCoordinator

    var body: some View {
        ZStack {
            DetailScreenView(viewModel: coordinator.detailViewModel)
        }
    }
}
