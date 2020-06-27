//
//  ResponseFeedItem.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import Foundation

/// ResponseFeedItem model
class ResponseFeedItem: Codable {
    let feedItemList: [FeedItem]?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case feedItemList = "rows"
        case title = "title"
    }
}
