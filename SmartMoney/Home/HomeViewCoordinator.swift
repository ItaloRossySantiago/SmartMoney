//
//  HomeCoordinator.swift
//  View Coordinator da tela
//
//  Criado por Italo Rossy em 19/06/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        // Adicione a implementação do início do coordinator aqui
        let viewController  = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
        viewController.onLogoffTappedClouser = {
            self.navigationController.popViewController(animated: true)
        }
   }

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
