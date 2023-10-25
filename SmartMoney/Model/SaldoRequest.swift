//
//  SaldoRequest.swift
//  SmartMoney
//
//  Created by Italo on 24/10/23.
//

import Foundation


struct SaldoRequest: Codable {
    let firebaseID, monthNumber, year: String

    enum CodingKeys: String, CodingKey {
        case firebaseID = "firebase_id"
        case monthNumber = "month_number"
        case year
    }
}
