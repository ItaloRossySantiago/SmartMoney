//
//  EndPoint.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

struct EndPoint {
   let path: String
   let method : HTTPMethod
   let headers : [String:String]?
   let parameters : Parameters?
    
    init(path: String, method: HTTPMethod = .get, headers: [String : String]? = nil, parameters: Parameters? = nil) {
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
}

enum Parameters {
    case dictionary([String:Any])
    case encodable([Encodable])
}
