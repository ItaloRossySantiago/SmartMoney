//
//  CardModel.swift
//  SmartMoney
//
//  Created by Italo on 18/11/23.
//

import Foundation

struct CategoryModel: Codable {
    let idCategory, idUser: Int
    let categoryName: String
}

typealias CategoryList = [CategoryModel]
