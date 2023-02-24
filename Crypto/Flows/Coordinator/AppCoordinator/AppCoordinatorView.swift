import SwiftUI
import SwiftUINavigation

struct AppCoordinatorView: View {
    
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            ZStack {
                switch coordinator.route {
                case .onIntroSelected:
                    IntroView(viewModel: coordinator.introViewModel)
                case .onMainSelected:
                    MainCoordinatorView(coordinator: coordinator.mainCoordinator).navigationBarBackButtonHidden(true)
                case .none:
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}
