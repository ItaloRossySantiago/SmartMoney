//
//  EndPoint.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//
import Foundation

struct Endpoint {
    let url: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: Parameters?
    
    init(url: String, method: HTTPMethod = .get, headers: [String : String]? = nil, parameters: Parameters? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
}

