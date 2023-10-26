//
//  RequestBuilder.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

protocol RequestBuilder {
    func buildRequest(with endPoint:EndPoint, baseUrl:URL) -> URLRequest
}
