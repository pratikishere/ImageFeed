//
//  FeedItemListViewController.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import UIKit

class FeedItemListViewController: UIViewController {

    /// View model for feed item list
    var feedItemListViewModel: FeedItemListViewModel!

    /// TableView init
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.separatorStyle = .none
        view.estimatedRowHeight = 100
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        /// Sets views background color
        self.view.backgroundColor = .white
        /// Sets title in navigation bar
        self.title = "Feed item list demo"

        /// Adds tableView as subview and sets constraint
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])

        /// Updates tableview when api response is successful
        feedItemListViewModel.onFeedItemLoaded = {
            self.tableView.reloadData()
        }
    }
}
