//
//  UserViewModel.swift
//  SmartMoney
//
//  Created by Italo on 24/08/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UserViewModel {
    private let auth: Auth!
    private let firestore: Firestore!
    init() {
        auth = Auth.auth()
        firestore = Firestore.firestore()
    }
    func registerNewUser(_ nome: String, _ email : String,_ password: String, completion: @escaping (NSDictionary) -> Void) {
        var resultReturn:NSDictionary = [:]
        guard nome != "" && email != "" && password != "" else {
            completion(["result":"error", "message_error":"invalidFields"])
            return
        }
        
        auth.createUser(withEmail: email, password: password) { (result, error) in
            
            if error == nil {
                if let idResultado = result?.user.uid {
                    self.firestore.collection("usuarios").document(idResultado).setData(["nome": nome, "email": email])
                }
                resultReturn = ["result":"success", "message_error":""]
                do {
                    try self.auth.signOut() }
                catch {
                    print("erro ao deslogar usuario")
                    
                }
                
            } else {
                resultReturn = ["result":"error", "message_error": error?.localizedDescription ?? "Erro ao cadastrar usuario"]
                
            }
            completion(resultReturn)
        }
    }
}
