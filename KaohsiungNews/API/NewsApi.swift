//
//  NewsApi.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/19.
//

import Foundation

struct NewsApi: Codable {
    var endPoint: EndPoints = .TopHeadLines
    var parameters: Parameter!
}

extension NewsApi {
    var url: URL? {
        let baseURL = Environment.baseURL
        guard let url = baseURL?.appendingPathComponent(endPoint.path).withQueries(parameters) else {
            fatalError("URL is incorrect!")
        }
        return url
    }
}
