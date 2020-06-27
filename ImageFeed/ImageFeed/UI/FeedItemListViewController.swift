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
    /// Cell id
    let cellId = "FeedItemTableViewCell"

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

        /// Sets tableView delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self

        /// Registers the tableView cell
        tableView.register(FeedItemTableViewCell.self, forCellReuseIdentifier: cellId)

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

        /// Update title in navigation bar from api response
        feedItemListViewModel.updateNavigationTitle = { title in
            self.title = title
        }
    }
}

extension FeedItemListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FeedItemTableViewCell
        cell.feedItemViewModel = feedItemListViewModel.feedItemViewModels[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedItemListViewModel.feedItemViewModels.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
