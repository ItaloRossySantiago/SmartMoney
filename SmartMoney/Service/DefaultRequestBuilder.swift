//
//  DefaultRequestBuilder.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

class DefaultRequestBuilder: RequestBuilder {
    func buildRequest(with endpoint: Endpoint, baseURL: String) -> URLRequest? {
        let completeURLString = baseURL + endpoint.url
        
        guard let url = URL(string: completeURLString) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        
        if let parameters = endpoint.parameters {
            switch parameters {
            case .dictionary(let dictionary):
                request.httpBody = try? JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
            case .encodable(let encodable):
                request.httpBody = try? JSONEncoder().encode(encodable)
            }
        }
        
        return request
    }
}

