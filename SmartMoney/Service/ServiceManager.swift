//
//  ServiceManager.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation

class ServiceManager: NetworkLayer {
    static var shared : ServiceManager = ServiceManager()
    var session: URLSession = URLSession.shared
    private var baseUrl: String
    
    init(baseUrl: String? = nil) {
        if let baseUrl {
            self.baseUrl = baseUrl
        } else if let baseUrlBundle = Bundle.main.infoDictionary?["baseUrl"] as? String {
            self.baseUrl = baseUrlBundle
        } else {
            self.baseUrl = ""
        }
        
    }
    
    
    func request<T,G>(with endPoint: EndPoint,  postFields:G, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable, G: Codable {
        let urlString: String = baseUrl + endPoint.path
        guard let url: URL = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        
        if request.httpMethod == "POST" {
            let encoder = JSONEncoder()
            do {
                let jsonData = try encoder.encode(postFields)
                request.httpBody = jsonData
            } catch {
                completion(.failure(.invalidJson))
                    return
            }
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                
                
                if let error {
                    print("Error na request, detalhe: \(error.localizedDescription)")
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
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let object:T = try decoder.decode(T.self, from: data)
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
