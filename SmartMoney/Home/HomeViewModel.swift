//
//  HomeViewModel.swift
//  ViewModel da tela
//
//  Criado por Italo Rossy em 19/06/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class HomeViewModel {
    // Adicione a implementação do ViewModel aqui
    let firebaseAuth = Auth.auth()
    let firestore = Firestore.firestore()
    let service: HomeService = HomeService()
    private var expenseList:[ExpenseModel]  = []
    public var numberOfRowsInSection: Int {
        return expenseList.count
    }
    
    private var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func signOutUser() {
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
  
    
    public func importUserData(completion: @escaping ([String: String]) -> Void) {
        let idUser = firebaseAuth.currentUser?.uid ?? ""
        firestore.collection("usuarios").document(idUser).getDocument { (document, error) in
            var resultCompletion: [String: String] = [:]
            
            if let document = document, document.exists {
                let data = document.data()
                resultCompletion = ["nome": data?["nome"] as? String ?? "",
                                    "url_img": data?["url_img"] as? String ?? ""]
            } else {
                resultCompletion = ["nome": "not_found"]
            }
            
            completion(resultCompletion)
        }
    }
    
    public func getSaldo() {
        let idUser = firebaseAuth.currentUser?.uid ?? ""
        service.getSaldo(idUser: idUser) { result in
            switch result {
            case .success(let success):
                self.delegate?.sucessGetSaldo(saldoresponse: success)
            case .failure(let failure):
                self.delegate?.errorGetSaldo()
            }
        }
    }
    
    public func getListExpense() {
        let idUser = firebaseAuth.currentUser?.uid ?? ""
        service.getListExpense(idUser: idUser) { result in
            switch result {
            case .success(let success):
                self.expenseList = success
                self.delegate?.sucessGetListExpenses(listExpense: success)
            case .failure(let failure):
                self.delegate?.errorGetListExpenses()
            }
        }
    }
    
    func loadCurrentExpense(indexPath: IndexPath) -> ExpenseModel {
        return expenseList[indexPath.row]
    }

    
}


