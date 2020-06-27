//
//  ApiService.swift
//  ImageFeed
//
//  Created by Pratik Patel on 27/06/20.
//

import Foundation

class ApiService {
    private let sourceURL = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!

    func loadFeedItems(completion: @escaping (([FeedItem], String?) -> ()), failure: @escaping (() -> ())) {

        URLSession.shared.dataTask(with: sourceURL) { (data, response, _) in

            if let data = data {
                guard let stringRepresentation = String(data: data, encoding: .isoLatin1) else { return }

                do {
                    if let jsonData = stringRepresentation.data(using: .utf8) {

                        let decoder = JSONDecoder()
                        let rootObj = try decoder.decode(ResponseFeedItem.self, from: jsonData)

                        if let feedItemList = rootObj.feedItemList {
                            DispatchQueue.main.async {
                                completion(feedItemList, rootObj.title)
                            }
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        failure()
                    }
                }
            } else {
                DispatchQueue.main.async {
                    failure()
                }
            }
        }.resume()
    }
}
