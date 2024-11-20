//
//  ImageCache.swift
//  FetchRecepieApp
//
//  Created by Srilu Rao on 11/19/24.
//

import UIKit
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var url: URL?
    private var cache = NSCache<NSURL, UIImage>()
    
    func loadImage(from url: URL) {
        self.url = url
        if let cachedImage = cache.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.cache.setObject(image, forKey: url as NSURL)
                if self.url == url {
                    self.image = image
                }
            }
        }.resume()
    }
}

