//
//  Parameter.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/19.
//

import Foundation

//typealias Value = String?
//typealias Parameters = [Parameter: Value]

struct Parameter : Codable {
    let apiKey: String
    let q: String?
    let country: String?
    let pageSize: String?
    let language: String?
    let category: String?
}

extension Parameter {
    init(apiKey: String) {
        self.init(apiKey: apiKey, q: nil, country: nil, pageSize: nil, language: nil, category: nil)
    }
}

//enum Parameter: String, Codable, CaseIterable {
//    case ApiKey
//    case Keyword
//    case Country
//    case PageSize
//
//    case Language
//    case Category
//
//    var key: String {
//        switch self {
//        case .ApiKey: return "apiKey"
//        case .Keyword: return "q"
//        case .Country: return "country"
//        case .PageSize: return "pageSize"
//        case .Language: return "language"
//        case .Category: return "category"
//        }
//    }
//}
