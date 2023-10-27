//
//  NetworkError.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation
enum NetworkError: Error {
case invalidURL(url: String)
case urlConstructionError
case noData
case invalidResponse
case decodingError(Error)
case networkFailure(Error)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "URL inválida -> \(url)"
        case .urlConstructionError:
            return "Falha na construção da URL"
        case .noData:
            return "Dados não recebidos da API."
        case .invalidResponse:
            return "Resposta inválida da API."
        case .decodingError(let error):
            return "Decodificação falhou: \(error.localizedDescription)"
        case .networkFailure(let error):
            return "Falha na rede: \(error.localizedDescription)"
        }
    }
}


