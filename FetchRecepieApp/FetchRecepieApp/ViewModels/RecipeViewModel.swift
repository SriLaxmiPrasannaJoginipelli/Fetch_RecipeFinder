//
//  RecipeViewModel.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//


import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let networkManager: NetworkingProtocol

    init(networkManager: NetworkingProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func fetchRecipes() {
        isLoading = true
        errorMessage = nil

        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        networkManager.fetchRecipes(from: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let recipes):
                    self?.recipes = recipes
                case .failure(let error):
                    self?.errorMessage = "Failed to load recipes: \(error.localizedDescription)"
                }
            }
        }
    }
}


