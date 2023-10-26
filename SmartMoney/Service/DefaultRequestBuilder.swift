//
//  DefaultRequestBuilder.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

class DefaultRequestBuilder : RequestBuilder {
    func buildRequest(with endPoint: EndPoint, baseUrl: URL) -> URLRequest {
       
        var request = URLRequest(url: baseUrl)
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.headers
        if let parameters = endPoint.parameters {
            let encoder = JSONEncoder()
            switch parameters{
                case .dictionary(let dictionary):
                    request.httpBody = try? JSONSerialization.data(withJSONObject: dictionary, options: .fragmentsAllowed)
            case .encodable(let encodable):
                    request.httpBody = try?  encoder.encode(encodable)
            }
        }
        return request
    }
}
