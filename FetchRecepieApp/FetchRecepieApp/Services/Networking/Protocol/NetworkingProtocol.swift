//
//  NetworkingProtocol.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import Foundation

protocol NetworkingProtocol {
    func fetchRecipes(from url: URL, completion: @escaping (Result<[Recipe], Error>) -> Void)
}

