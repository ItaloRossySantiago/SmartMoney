//
//  LoginViewController.swift
//  Controlador da tela
//
//  Criado por Italo Rossy em 18/06/23.
//

import UIKit

class RegisterViewController: UIViewController {
    let loginViewModel = LoginViewModel()
    var imagePicker = UIImagePickerController()
    let registerView = RegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        registerView.delegate = self
        registerView.setupTextFieldDelegates(self)
        hideKeyBoardWhenTappedAround()
    }
    
   // CLOUSURES
    var onRegisterSuccess:(() -> Void)?
    var onReturnToLogin:(() -> Void)?

}

extension RegisterViewController : UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate, RegisterViewDelegate  {

    func returnToLogin() {
        self.onReturnToLogin?()
    }
  
    func onSelectUserImage() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func onRegisterButtonTapped(name: String, email: String, password: String, image: UIImage) {
        self.showLoadingView()
        let viewModel = RegisterViewModel()
        viewModel.registerNewUser(name, email, password, image) { data in
            if let result:String = data["result"] as? String,
               let messageError:String = data["message_error"] as? String {
                if result == "error" {
                    self.closeLoadingView()
                    self.showMessage("Erro", messageError)
                } else if result == "success" {
                    self.closeLoadingView()
                    self.onRegisterSuccess?()
                   
                    
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        registerView.iconApp.image = imageSelected
        imagePicker.dismiss(animated: true)
    }
}
