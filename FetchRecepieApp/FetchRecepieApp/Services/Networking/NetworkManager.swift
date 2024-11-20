//
//  NetworkManager.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import Foundation

class NetworkManager: NetworkingProtocol {
    static let shared = NetworkManager()
    private init() {}

    func fetchRecipes(from url: URL, completion: @escaping (Result<[Recipe], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "DataError", code: 0, userInfo: nil)))
                return
            }

            do {
                let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
                completion(.success(response.recipes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

