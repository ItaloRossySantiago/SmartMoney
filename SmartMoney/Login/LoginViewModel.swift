//
//  LoginViewModel.swift
//  ViewModel da tela
//
//  Criado por Italo Rossy em 18/06/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    lazy var auth = Auth.auth()
    func login(email:String, password:String,  completionHandler: @escaping (Result<UserModel, Error>) -> Void) {
        let userModel = UserModel(email: email, password: password)
    
        self.auth.signIn(withEmail: userModel.email, password: userModel.password) { (result,error) in
            if let error = error {
                completionHandler(.failure(error))
                
            } else {
                completionHandler(.success(userModel))
                
            }
            
        }
    
    }
    
    
}
