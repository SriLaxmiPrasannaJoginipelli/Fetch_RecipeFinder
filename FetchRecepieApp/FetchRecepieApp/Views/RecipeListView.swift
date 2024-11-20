//
//  RecipeListView.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .accessibilityIdentifier("LoadingIndicator")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                        .accessibilityIdentifier("ErrorText")
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes available")
                        .padding()
                        .accessibilityIdentifier("NoRecipesText")
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRowView(recipe: recipe)
                            .accessibilityIdentifier("RecipeCell_\(recipe.id)")
                    }
                    .accessibilityIdentifier("RecipeListView")
                }
                
            }
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Refresh") {
                        viewModel.fetchRecipes()
                    }
                    .accessibilityIdentifier("RefreshButton")
                }
            }
            .onAppear {
                viewModel.fetchRecipes()
            }
        }
    }
}
