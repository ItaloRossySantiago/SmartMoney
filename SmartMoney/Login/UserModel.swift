//
//  UserModel.swift
//
//  Created by Italo Rossy on 19/06/23.
//

import Foundation

class UserModel : Codable {
    let email : String
    let password: String
    
    init () {
        self.email = String()
        self.password = String()
    }
    
    init(email:String,password:String){
        self.email = email
        self.password = password
        
    }
}
