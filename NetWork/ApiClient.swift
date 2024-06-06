//
//  ApiClient.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import Foundation

class APIClient {
    
    func recipeData(completion: @escaping (Swift.Result<[CulinariCompassElement], Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "x-rapidapi-host": "recipe-book2.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: URL(string: "https://recipe-book2.p.rapidapi.com/recipes-popular")!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode([CulinariCompassElement].self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }.resume()
    }
}

