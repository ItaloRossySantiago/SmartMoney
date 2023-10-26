//
//  ServiceManager.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation

class ServiceManager: NetworkLayer {
    static var shared : ServiceManager = ServiceManager()
    var session: URLSession
    private var baseUrl: String
    private var requestBuilder: RequestBuilder
    private var decoder:JSONDecoder
    
    init(session: URLSession = URLSession.shared, baseUrl: String? = nil, requestBuilder: RequestBuilder = DefaultRequestBuilder(),
         decoder:JSONDecoder = JSONDecoder()) {
        self.requestBuilder = requestBuilder
        self.session = session
        self.decoder = decoder
        if let baseUrl {
            self.baseUrl = baseUrl
        } else if let baseUrlBundle = Bundle.main.infoDictionary?["baseUrl"] as? String {
            self.baseUrl = baseUrlBundle
        } else {
            self.baseUrl = ""
        }
    }
    
    func request<T>(with endPoint: EndPoint, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
         let urlString = baseUrl + endPoint.path
        guard let url:URL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let request = requestBuilder.buildRequest(with: endPoint, baseUrl: url)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.networkFailure(error)))
                    return
                }
                
                guard let data else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse,200...299 ~= response.statusCode  else {
                    completion(.failure(.invalidResponse))
                    return
                }
        
                do {
                    let object:T = try self.decoder.decode(T.self, from: data)
                    completion(.success(object))
                    return
                } catch  {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
        task.resume()
        
    }
  

}
