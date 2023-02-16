//
//  DetailCoordinator.swift
//  Crypto
//
//  Created by Developer on 15.02.2023.
//

import Foundation

class DetailCoordinator: ObservableObject {
    
    enum Result {
        case navigationToMainScreen
    }
    
    var onResult: ((Result) -> Void)?
    var detailViewModel: DetailViewModel
    
    init(detailViewModel: DetailViewModel) {
        self.detailViewModel = detailViewModel
        detailViewModel.onResult = { [weak self] result in
            switch result {
            case .navigationToMainScreen:
                self?.onResult?(.navigationToMainScreen)
            }
        }
    }
}
