//
//  DetailViewModel.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 06/06/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    static let shared = DetailViewModel()
    @Published var favorites: [CulinariCompassElement] = []
    private let key = "Favorites"
    
    init() {
        loadFavorites()
    }
    
    func addToFavorites(receta: CulinariCompassElement) {
        if !favorites.contains(where: { $0.path == receta.path}) {
            favorites.append(receta)
            saveFavorites()
        }
    }
    func removeFromFavorites(receta: CulinariCompassElement) -> Bool {
        return favorites.contains { $0.path == receta.path }
    }
    func isFavorite(receta: CulinariCompassElement) -> Bool {
        return favorites.contains { $0.path == receta.path }
    }
    func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: key),
            let decoded = try? JSONDecoder().decode([CulinariCompassElement].self, from: data) {
            favorites = decoded
        } else {
            favorites = []
        }
    }
}
