//
//  NewsApiTests.swift
//  KaohsiungNewsTests
//
//  Created by ChaoBo-Shang on 2022/10/27.
//

@testable import KaohsiungNews
import XCTest

class NewsApiTests: XCTestCase {

    private var newsApi:NewsApi!
    private var themeList: ThemeList!
    
    override func setUp() {
        super.setUp()
        self.newsApi = NewsApi(endPoint: .TopHeadLines,
                               parameters: Parameter(apiKey:Environment.apiKey))
        
        let url = Bundle.main.url(forResource: "Themes", withExtension: "plist")!
                
        if let data = try? Data(contentsOf: url) {
            do {
                let themes = try PropertyListDecoder().decode([Theme].self, from: data)
                self.themeList = ThemeList(themes: themes)
            } catch {
                print(error)
            }
        }
    }
    
    func test_decode_newsapi_json() {
        let jsonString = """
        [{
            "endPoint":"TopHeadLines",
            "parameters":{
                "apiKey": "d35766c79dc843c3b5f711250ce0a5c9",
                "category":"asdfasd"
            }
        }]
        """

        let jsonData = Data(jsonString.utf8)
        
        // and decode it back
        let decodedSentences = try? JSONDecoder().decode([NewsApi].self, from: jsonData)
        XCTAssertEqual(decodedSentences?.first?.endPoint.path,"/v2/top-headlines")
        XCTAssertEqual(decodedSentences?.first?.parameters.apiKey,Environment.apiKey)
        XCTAssertEqual(decodedSentences?.first?.parameters.category,"asdfasd")
    }
    
    func test_read_newsapi_url() {
        let topHeadLinesUrl = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=d35766c79dc843c3b5f711250ce0a5c9")?.absoluteURL
        XCTAssertEqual(topHeadLinesUrl, self.newsApi.url?.absoluteURL)
    }
    
    func test_read_PropertyList() {
        XCTAssertEqual(self.themeList.themes.count,8)
    }
    
    override func tearDown() {
        super.tearDown()
    }

}
