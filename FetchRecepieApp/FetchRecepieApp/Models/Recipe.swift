//
//  Recipe.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: UUID
    let cuisine: String
    let name: String
    let photoUrlSmall: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine, name
        case photoUrlSmall = "photo_url_small"
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

