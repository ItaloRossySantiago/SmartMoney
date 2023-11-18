//
//  CardModel.swift
//  SmartMoney
//
//  Created by Italo on 18/11/23.
//

import Foundation

struct CardModel: Codable {
    let idCard, idUser: Int
    let cardName: String
}

typealias CardList = [CardModel]
