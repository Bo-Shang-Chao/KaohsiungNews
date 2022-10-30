//
//  Theme.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/28.
//

import Foundation

struct Theme: Codable {
    let title: String
    let newsApi: NewsApi!
}

struct ThemeList: Codable {
    let themes: [Theme]
}

extension Theme {
    var apiResource: Resource<ArticleList>? {
        guard let url = newsApi.url else {
            fatalError("URL is incorrect!")
        }
        return Resource<ArticleList>(url: url)
    }
}
