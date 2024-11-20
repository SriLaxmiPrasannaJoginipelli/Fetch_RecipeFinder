//
//  ImageChacheManager.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import UIKit

class ImageCacheManager: ImageCachingProtocol {
    static let shared = ImageCacheManager()
    private init() {}

    private let cache = NSCache<NSURL, UIImage>()

    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            self.cacheImage(image, for: url)
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }

    func cacheImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
