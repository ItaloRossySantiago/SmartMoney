//
//  NetworkLayer.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation

protocol NetworkLayer {
    var session: URLSession { get }
    func request<T:Decodable,G:Codable>(with endPoint:EndPoint, postFields:G, decodeType: T.Type, completion:@escaping(Result<T,NetworkError>) -> Void)
}
