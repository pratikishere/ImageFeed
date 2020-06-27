//
//  FeedItem.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import Foundation

/// FeedItem model
class FeedItem: Codable {
    var title: String?
    var description: String?
    var image: String?

    private enum CodingKeys: String, CodingKey {
        case title, description
        case image = "imageHref"
    }
}
