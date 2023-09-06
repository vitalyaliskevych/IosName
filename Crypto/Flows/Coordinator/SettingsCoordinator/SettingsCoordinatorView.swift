//
//  SettingsCoordinatorView.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import SwiftUI
import SwiftUINavigation

struct SettingsCoordinatorView: View {
    
    @ObservedObject var coordinator: SettingsCoordinator
    
    var body: some View {
        ZStack {
            SettingsView(
                viewModel: coordinator.settingsViewModel
            )
        }
    }
}
