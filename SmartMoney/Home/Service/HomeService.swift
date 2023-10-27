//
//  HomeService.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

class HomeService {
    public func getSaldo(idUser:String, completion: @escaping(Result<SaldoResponse,NetworkError>) -> Void) {
        let idUser = idUser
        let saldoRequest = SaldoRequest(firebaseID: idUser, monthNumber: "10", year: "2023")
        let endPoint:Endpoint = Endpoint(url: "/getSaldo", method: .post, headers: nil, parameters: .encodable(saldoRequest))

        APIClient.shared.request(with: endPoint, decodeType: SaldoResponse.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
             
        }
    }
    
    public func getListExpense(idUser:String, completion: @escaping(Result<ExpenseList,NetworkError>) -> Void) {
        let idUser = idUser
        let saldoRequest = SaldoRequest(firebaseID: idUser, monthNumber: "10", year: "2023")
        let endPoint:Endpoint = Endpoint(url: "/listExpenses", method: .post, headers: nil, parameters: .encodable(saldoRequest))

        APIClient.shared.request(with: endPoint, decodeType: ExpenseList.self) { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
             
        }
    }
    
    
}
