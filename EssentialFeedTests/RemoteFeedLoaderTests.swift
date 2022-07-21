//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Dronavalli on 21/07/22.
//

import Foundation
import XCTest

class RemoteFeedLoader
{
    
}
class HTTPClient {
    var requestURL : URL?
}

class RemoteFeedLoaderTests : XCTestCase {
   
    func test_init() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestURL)
    }
}
