//
//  EndPoints.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/19.
//

import Foundation

enum EndPoints: String, Codable, CaseIterable {
    case TopHeadLines
    case Everything
    case Source
    
    var path: String {
        switch self {
        case .TopHeadLines: return "/v2/top-headlines"
        case .Everything: return "/v2/everything"
        case .Source: return "/v2/sources"
        }
    }
}
