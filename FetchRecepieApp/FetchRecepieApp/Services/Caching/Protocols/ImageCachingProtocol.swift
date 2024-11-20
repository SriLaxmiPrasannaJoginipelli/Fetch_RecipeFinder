//
//  ImageCachingProtocol.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import UIKit

protocol ImageCachingProtocol {
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
    func cacheImage(_ image: UIImage, for url: URL)
}

