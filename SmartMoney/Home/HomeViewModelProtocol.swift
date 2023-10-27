//
//  HomeViewModelProtocol.swift
//  SmartMoney
//
//  Created by Italo on 26/10/23.
//

import Foundation

protocol HomeViewModelProtocol {
    func sucessGetSaldo(saldoresponse :SaldoResponse)
    func errorGetSaldo()
    
    func sucessGetListExpenses(listExpense :ExpenseList)
    func errorGetListExpenses()
}
