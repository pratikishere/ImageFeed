//
//  AppDelegate.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        /// Sets FeedItemListViewController as rootViewController
        if let keyWindow = window {
            let feedItemListVC = FeedItemListViewController()
            feedItemListVC.feedItemListViewModel = FeedItemListViewModel()
            let rootViewController = UINavigationController(rootViewController: feedItemListVC)
            keyWindow.rootViewController = rootViewController
            keyWindow.makeKeyAndVisible()
        }
        return true
    }
}

