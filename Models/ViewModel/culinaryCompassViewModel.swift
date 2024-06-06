//
//  culinaryCompassViewModel.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 05/06/24.
//

import Foundation
import Combine

class CulinariCompassViewModel: ObservableObject {
    @Published var culinariCompass: [CulinariCompassElement]? = []
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    private let apiClient = APIClient()
    
    func fetchCulinariCompassData() {
        apiClient.recipeData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let culinariCompass):
                    self?.culinariCompass = culinariCompass
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

