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
    let client : HTTPClient
    let url : URL
    
    init(url : URL  , client: HTTPClient) {
        
        self.client = client
        self.url = url
    }
    func load() {
        client.get(from : url)
    }
    
}
protocol HTTPClient {
    func get(from url: URL)
}



class RemoteFeedLoaderTests : XCTestCase {
   
    func test_init_doesNotRequestDataFromURL() {
        let(_,client) = makeSUT()
        XCTAssertNil(client.requestURL)
    }
    
    func test_load_requestDataFromURL() {
        let url = URL(string: "https://a-given-url.com")
        let (sut, client) = makeSUT(url: url!)
        sut.load()
        XCTAssertEqual(client.requestURL, url)
    }
    // MARK : HELPERS
    private func makeSUT(url: URL = URL(string: "https://a.url.com")!) -> (sut: RemoteFeedLoader, client : HTTPClientSpy) {
        
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return(sut,client)
    }
    private class HTTPClientSpy: HTTPClient {
        var requestURL : URL?
        func get(from url: URL)
        {
            requestURL = url
        }
    }
}
