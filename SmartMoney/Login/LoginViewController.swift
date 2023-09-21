//
//  LoginViewController.swift
//  Controlador da tela
//
//  Criado por Italo Rossy em 18/06/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    let loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configConstraints()
        hideKeyBoardWhenTappedAround()
        
    }
    


   // CLOUSURES
   var onLoginSuccess:(() -> Void)?
   var onRegisterTappedClouser:(() -> Void)?
   
 
      private func setupView() {
          view.backgroundColor = .white
          view.addSubview(userTextField)
          view.addSubview(senhaTextField)
          view.addSubview(loginButton)
          view.addSubview(criarContaLabel)
          view.addSubview(iconApp)
          view.addSubview(AppNameLabel)
          view.addSubview(iconPerson)
          view.addSubview(iconPassword)
        // Adicione a implementação do setupView aqui
     }

    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            // coloque aqui suas constraints
            
            iconApp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconApp.widthAnchor.constraint(equalToConstant: 150),
            iconApp.heightAnchor.constraint(equalToConstant: 200),
            
            AppNameLabel.topAnchor.constraint(equalTo: iconApp.bottomAnchor, constant: 10),
            AppNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            
            senhaTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            senhaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            senhaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            senhaTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            criarContaLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 35),
            criarContaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            iconPerson.topAnchor.constraint(equalTo: userTextField.topAnchor),
            iconPerson.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor, constant: -30),
            iconPerson.heightAnchor.constraint(equalTo: userTextField.heightAnchor),
            iconPerson.widthAnchor.constraint(equalToConstant:  25),
            
            iconPassword.topAnchor.constraint(equalTo: senhaTextField.topAnchor),
            iconPassword.leadingAnchor.constraint(equalTo: senhaTextField.leadingAnchor, constant: -30),
            iconPassword.heightAnchor.constraint(equalTo: senhaTextField.heightAnchor),
            iconPassword.widthAnchor.constraint(equalToConstant:  25)
        ])
    }
    
    lazy var userTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o email"
        let placeholderText = "Digite o email"
        let attributes: [NSAttributedString.Key: Any] = [
           .foregroundColor: UIColor.lightGray              ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .white
        textField.delegate = self
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        textField.text = "italocurty24@gmail.com"
        textField.resignFirstResponder()
        textField.autocorrectionType = .no
        textField.backgroundColor = .black
        
        return textField
    }()
    
    lazy var senhaTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = "Digite a senha"
        let attributes: [NSAttributedString.Key: Any] = [
           .foregroundColor: UIColor.lightGray              ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.delegate = self
        textField.keyboardType = .default
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.resignFirstResponder()
        textField.isSecureTextEntry = true
        textField.text = "123456"
        textField.autocorrectionType = .no
        textField.backgroundColor = .black
       
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black

        return button
    }()
    
    lazy var criarContaLabel: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTitle("Não possui conta ? Criar conta ", for: .normal)
        label.setTitleColor(.black, for: .normal)
        label.backgroundColor = .white
        label.addTarget(self, action: #selector(onRegisterTapped), for: .touchUpInside)
        return label
    }()
    
    @objc func onRegisterTapped() {
        self.onRegisterTappedClouser?()
    }
    private func successLogin() {
        self.onLoginSuccess?()
    }
    
    @objc func onLoginTapped() {
        let email    = userTextField.text ?? ""
        let password = senhaTextField.text ?? ""
        
        loginViewModel.login(email : email, password: password) {[weak self] result in
            switch result {
            case .success(_):
                self?.successLogin()
                    
                
            case .failure(let error):
                if error.localizedDescription.contains("Access to this account has") == true {
                    self?.showMessage("Atençao !", "O acesso a conta foi temporariamente bloqueado devido a diversas tentativas com senha incorreta. Para acesso imediato reset sua senha, ou tente novamente mais tarde.")
                } else if error.localizedDescription == "The password is invalid or the user does not have a password." {
                    self?.showMessage("Atençao !", "Senha invalida, verifique!")
                } else {
                    self?.showMessage("Erro", error.localizedDescription)
                }
            }
        }
    }
    
    lazy var iconApp : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "iconApp")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var AppNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SmartMoney"
        label.font = UIFont(name: "Pacifico", size: 35)
        label.textColor =  .black
        return label
    }()
    
    lazy var iconPerson: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var iconPassword: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "lock.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        return imageView
    }()
    
}
