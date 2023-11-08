//
//  Coordinator.swift
//  MVVM
//
//  Created by Italo on 30/10/23.
//

import Foundation
import UIKit

class ListExpensesCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        // Adicione a implementação do início do coordinator aqui
        let viewController  = ListExpensesViewController()
        self.navigationController.pushViewController(viewController, animated: true)
   }

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
