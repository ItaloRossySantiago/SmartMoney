//
//  NetworkError.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation
// Enum criado para organizar de maneira escalavel as respostas de erro da camada network
enum NetworkError: Error {
   case invalidURL
   case noData
   case invalidResponse
   case decodingError(Error)
   case networkFailure(Error)
   case invalidJson
}


extension NetworkError : LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidURL:
                return "URL invalida."
            case .noData:
                return "URL invalida."
            case .invalidResponse:
                return "URL invalida."
            case .decodingError(let error):
                return "Erro ao decodificar, detalhe do erro: \(error.localizedDescription)"
            case .networkFailure(let error):
                return "Falha na rede, detalhe do erro: \(error.localizedDescription)"
                
            case .invalidJson:
                return "Json invalido."
        }
        
        
        
    }
}
