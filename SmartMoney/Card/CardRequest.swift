//
//  CardRequest.swift
//  SmartMoney
//
//  Created by Italo on 18/11/23.
//

import Foundation

struct CardRequest: Encodable {
    let firebaseId : String
    enum CodingKeys: String, CodingKey {
        case firebaseId = "firebase_id"
    }
}