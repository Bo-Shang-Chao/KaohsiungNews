//
//  Webservice.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url: URL){
        self.url = url
    }
}

class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error)
                completion(.failure(.connectError))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = response.handleNetworkResponse()
                
                switch result {
                case .success:
                    guard let data = data else{
                        completion(.failure(.domainError))
                        return
                    }
                    
                    let result = try? JSONDecoder().decode(T.self, from: data)
                    if let result = result {
                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } else {
                        completion(.failure(.decodingError))
                    }
                case .failure(let failureError):
                    print(failureError)
                    completion(.failure(.responseError))
                }
            }
        }.resume()
    }
}
