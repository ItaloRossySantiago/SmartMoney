//
//  RegisterViewDelegate.swift
//  SmartMoney
//
//  Created by Italo on 31/08/23.
//

import Foundation
import UIKit

protocol RegisterViewDelegate : AnyObject {
    func returnToLogin()
    func onRegisterButtonTapped(name: String, email: String, password: String, image: UIImage)
    func onSelectUserImage()
    
}
