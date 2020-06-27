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
    /// Closure which is called after API completion to update navigation title
    var updateNavigationTitle: ((String) -> ())?

    private var apiService: ApiService

    init(apiService: ApiService) {
        self.apiService = apiService
        loadFeedItems()
    }

    /// This function calls feed load api and updates the UI in FeedItemListViewController
    func loadFeedItems() {

        apiService.loadFeedItems(completion: { [unowned self] items, title in
                /// Filters the data if title, description and image are not nil and binds to feed item models
                self.feedItemViewModels = items.filter{
                    $0.title != nil && $0.description != nil && $0.image != nil
                }.compactMap(FeedItemViewModel.init)

                self.onFeedItemLoaded()
                self.updateNavigationTitle?(title ?? "")
            }, failure: {})
    }
}
