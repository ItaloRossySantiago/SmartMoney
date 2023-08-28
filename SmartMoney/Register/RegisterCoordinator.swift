import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController

    func start() {
        // Adicione a implementação do início do coordinator aqui
      let viewController  = RegisterViewController()
      self.navigationController.pushViewController(viewController, animated: true)
        viewController.onRegisterSuccess = {
            self.navigationController.popViewController(animated: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.navigationController.topViewController?.showMessageOnTimer("Sucesso", "Usuario Cadastrado.")
            }
            
        }
        viewController.onReturnToLogin = {
            self.navigationController.popToRootViewController(animated: true)
        }
   }

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
