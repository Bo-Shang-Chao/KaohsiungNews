//
//  HTTPURLResponse+Extension.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/12.
//

import Foundation

extension HTTPURLResponse {
    func handleNetworkResponse() -> NetworkResult<String> {
        switch self.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
