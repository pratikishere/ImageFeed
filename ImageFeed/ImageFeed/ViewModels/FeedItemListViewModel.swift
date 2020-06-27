//
//  FeedItemListViewModel.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import Foundation

/// View model for FeedItemListViewController
class FeedItemListViewModel {
    /// List of feed item view models
    private(set) var feedItemViewModels: [FeedItemViewModel] = [FeedItemViewModel]()
    /// Closure which is called after the items are loaded from API
    var onFeedItemLoaded: (() -> ()) = {}

    init() {
        onFeedItemLoaded()
    }
}
