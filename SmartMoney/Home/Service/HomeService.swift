//
//  HomeService.swift
//  SmartMoney
//
//  Created by Italo on 25/10/23.
//

import Foundation

class HomeService {
    public func getSaldo(idUser:String) {
        let idUser = idUser
        let saldoRequest = SaldoRequest(firebaseID: idUser, monthNumber: "10", year: "2023")
        let endPoint:EndPoint = EndPoint(path: "/getSaldo", method: .post, headers: nil, parameters: nil)

        ServiceManager.shared.request(with: endPoint, decodeType: SaldoResponse.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
             
        }
    }
}
