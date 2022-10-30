//
//  Article.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

extension ArticleList {
    static var Kaohsiung: Resource<ArticleList> = {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=%E9%AB%98%E9%9B%84&language=zh&sortBy=publishedAt&apiKey=d35766c79dc843c3b5f711250ce0a5c9") else {
            fatalError("URL is incorrect!")
        }
        return Resource<ArticleList>(url: url)
    }()
}
