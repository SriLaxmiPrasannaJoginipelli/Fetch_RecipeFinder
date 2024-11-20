//
//  RecipeRowView.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    @State private var image: UIImage?
    private let imageCache: ImageCachingProtocol

    init(recipe: Recipe, imageCache: ImageCachingProtocol = ImageCacheManager.shared) {
        self.recipe = recipe
        self.imageCache = imageCache
    }

    var body: some View {
        HStack {
            if let url = recipe.photoUrlSmall {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .accessibilityIdentifier("CusineImage")
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                        .onAppear {
                            imageCache.loadImage(from: url) { loadedImage in
                                self.image = loadedImage
                            }
                        }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.gray)
            }

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
            }
        }
        .accessibilityIdentifier("RecipeRow_\(recipe.id.uuidString)") 
    }
}
