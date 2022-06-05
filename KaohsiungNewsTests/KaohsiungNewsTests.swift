//
//  KaohsiungNewsTests.swift
//  KaohsiungNewsTests
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

@testable import KaohsiungNews
import XCTest

class KaohsiungNewsTests: XCTestCase {
    
    private var articleListVM: ArticleListViewModel!
    
    override func setUp() {
        super.setUp()
        self.articleListVM = ArticleListViewModel([Article(title: "Top News", description: "desc1", url: "https://", urlToImage: "httpss://image"), Article(title: "Top News2", description: "desc1", url: "https://", urlToImage: "httpss://image")])
        
    }
    
    func test_article_title() {
        let titles = ["Top News","Top News2"]
        for index in 0 ... self.articleListVM.numberOfSection {
            XCTAssertEqual(self.articleListVM.articleAtIndex(index).title, titles[index])
        }
    }
    
    func test_downloadArticles() {
        // 1. Define an expectation
        let expectation = expectation(description: "Webservice does stuff and runs the callback closure")

        let url = URL(string: "https://newsapi.org/v2/everything?q=%E9%AB%98%E9%9B%84&language=zh&sortBy=publishedAt&apiKey=d35766c79dc843c3b5f711250ce0a5c9")!
        Webservice().getArticles(url: url) { articles in
            XCTAssertNotNil(articles)

            // Don't forget to fulfill the expectation in the async callback
            expectation.fulfill()
        }

        // 3. Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
}
