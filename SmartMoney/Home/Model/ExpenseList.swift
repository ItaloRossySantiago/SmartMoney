//
//  ListExpenses.swift
//  SmartMoney
//
//  Created by Italo on 26/10/23.
//

import Foundation

struct ExpenseModel: Codable {
    let idExpenses, idUser: Int
    let description, dateExpense: String
    let idCategory, valueExpense: Double
}

typealias ExpenseList = [ExpenseModel]
