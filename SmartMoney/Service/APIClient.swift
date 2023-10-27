import Foundation

class APIClient: HTTPClient {
    
    static let shared = APIClient()
    
    private var session: URLSession
    private var baseURL: String
    private var requestBuilder: RequestBuilder
    private var decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, baseURL: String? = nil, requestBuilder: RequestBuilder = DefaultRequestBuilder(), decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.decoder = decoder
        
        if let baseURL {
            self.baseURL = baseURL
        } else if let baseUrlString = Bundle.main.infoDictionary?["baseUrl"] as? String {
            self.baseURL = baseUrlString
        } else {
            self.baseURL = ""
        }
    }
    
    func request<T: Decodable>(with endpoint: Endpoint, decodeType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let request = requestBuilder.buildRequest(with: endpoint, baseURL: baseURL) else {
            let completeURLString = baseURL + endpoint.url
            NetworkLogger.logError(error: .urlConstructionError, url: completeURLString)
            completion(.failure(.invalidURL(url: completeURLString)))
            return
        }
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            NetworkLogger.log(request: request, response: response, data: data, error: error)
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(.networkFailure(error)))
                    return
                }
                
                guard let data else {
                    completion(.failure(.noData))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                do {
                    guard let self else {
                        throw NetworkError.decodingError(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "O decoder foi desalocado")))
                    }
                    let object: T = try self.decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        task.resume()
    }
}

