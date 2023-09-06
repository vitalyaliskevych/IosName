//
//  MainCoordinatorView.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct MainCoordinatorView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                MainView(viewModel: coordinator.mainViewModel)
                    .navigationBarBackButtonHidden(true)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.onSettingsSelected,
                    destination: {coordinator in
                        SettingsCoordinatorView(
                            coordinator: coordinator.wrappedValue).navigationBarBackButtonHidden(true)
                    }, onNavigate: {_ in}
                ) {}
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /MainCoordinator.Route.onCoinItemSelected,
                    destination: {(coordinator: Binding<DetailCoordinator>) in
                        DetailCoordinatorView(
                            coordinator: coordinator.wrappedValue).navigationBarBackButtonHidden(true)
                    }, onNavigate: {_ in}
                ) {}
            }
        }
    }
}
