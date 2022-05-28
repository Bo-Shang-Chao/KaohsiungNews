//
//  Article.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}
