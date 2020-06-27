//
//  FeedItemViewModel.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import Foundation

/// View model for FeedItem
class FeedItemViewModel {
    var title: String?
    var description: String?
    var image: String?

    init(title: String?, description: String?, image: String?) {
        self.title = title
        self.description = description
        self.image = image
    }

    init(feedItem: FeedItem)  {
        self.title = feedItem.title
        self.description = feedItem.description
        self.image = feedItem.image
    }
}
