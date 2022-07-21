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
    func load() {
        HTTPClient.shared.get(from : URL(string: "https://a-url.com")!)
    }
    
}
class HTTPClient {
    static var shared = HTTPClient() //it is not singleton
    func get(from url: URL){}
}

class HTTPClientSpy: HTTPClient {
    
    override func get(from url: URL)
    {
        requestURL = url
    }
    var requestURL : URL?
}

class RemoteFeedLoaderTests : XCTestCase {
   
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        sut.load()
        XCTAssertNotNil(client.requestURL)
    }
}
