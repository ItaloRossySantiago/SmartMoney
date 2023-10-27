//
//  NetworkLayer.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(with endpoint: Endpoint, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}
