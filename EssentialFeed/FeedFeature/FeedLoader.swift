//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Dronavalli on 21/07/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
