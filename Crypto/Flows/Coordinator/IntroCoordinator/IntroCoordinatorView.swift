//
//  IntroCoordinatorView.swift
//  Crypto
//
//  Created by Developer on 20.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct IntroCoordinatorView: View {
    
    @ObservedObject var coordinator: IntroCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                IntroView(viewModel: coordinator.introViewModel)
                NavigationLink(
                    unwrapping: $coordinator.route,
                    case: /IntroCoordinator.Route.onMainSelected,
                    destination: {(coordinator: Binding<MainCoordinator>) in
                        MainCoordinatorView(
                            coordinator: coordinator.wrappedValue).navigationBarBackButtonHidden(true)
                    }, onNavigate: {_ in}) {}
            }
            
        }
    }
}


