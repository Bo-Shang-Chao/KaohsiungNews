//
//  URL+Extension.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/19.
//

import Foundation

extension URL {
    func withQueries(_ queries: Parameter) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        
        var queryItems = [URLQueryItem]()
        
        let language = "zh"
        queryItems.append(URLQueryItem(name: "language", value: language))
        
        if let category = queries.category {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        if let country = queries.country {
            queryItems.append(URLQueryItem(name: "country", value: country))
        }
        
        if let q = queries.q {
            queryItems.append(URLQueryItem(name: "q", value: q))
        }
        
        if let pageSize = queries.pageSize {
            queryItems.append(URLQueryItem(name: "pageSize", value: pageSize))
        }
        
        queryItems.append(URLQueryItem(name: "apiKey", value: queries.apiKey))
        
        components?.queryItems = queryItems
//        components?.queryItems = queries.map { (parameter, value) in
//            URLQueryItem(name: parameter.key, value: value)
//        }
        return components?.url
    }
}
