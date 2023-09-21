//
//  LoginCoordinator.swift
//  View Coordinator da tela
//
//  Criado por Italo Rossy em 18/06/23.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginCoordinator: Coordinator {

    var navigationController: UINavigationController
    var auth: Auth!
    let viewController = LoginViewController()
    func start() {
        // Adicione a implementação do início do coordinator aqui
        auth = Auth.auth()
        self.viewController.onRegisterTappedClouser = {
            let coordinator = RegisterCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        self.viewController.onLoginSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }

        if auth.currentUser?.uid != nil {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        } else {
            self.navigationController.pushViewController(self.viewController, animated: true)
        }
   }

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.isNavigationBarHidden = true
    }
}
