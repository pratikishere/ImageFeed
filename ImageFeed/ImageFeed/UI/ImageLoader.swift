//
//  ImageLoader.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import UIKit

/// To maintain image urls in cache
let imageCache = NSCache<AnyObject, AnyObject>()

/// ImageLoader displays activity indicator until image is loaded from url
class ImageLoader: UIImageView {

    private var imageURL: URL?
    private let activityIndicator = UIActivityIndicatorView()

    func loadImageWithUrl(_ url: URL, failure: @escaping (() -> ())) {

        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url
        image = nil

        activityIndicator.startAnimating()

        /// Retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        /// URLSession data task to load image from url
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                DispatchQueue.main.async(execute: {
                    self.activityIndicator.stopAnimating()
                })
                return
            }

            DispatchQueue.main.async(execute: {

                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                    if self.imageURL == url {
                        self.image = imageToCache
                    }

                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                } else {
                    failure()
                }

                self.activityIndicator.stopAnimating()
            })
        }).resume()
    }
}
