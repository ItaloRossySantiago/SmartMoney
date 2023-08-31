//
//  LoginViewController.swift
//  Controlador da tela
//
//  Criado por Italo Rossy em 18/06/23.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate,
                              UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let loginViewModel = LoginViewModel()
    var imagePicker = UIImagePickerController()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    let loadingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configConstraints()
        hideKeyBoardWhenTappedAround()
        nameTextField.text = "Italo Rossy"
        userTextField.text = "italocurty24@gmail.com"
        senhaTextField.text = "123456"
    }
    
   // CLOUSURES
    var onRegisterSuccess:(() -> Void)?
    var onReturnToLogin:(() -> Void)?
    
    
    private func setupView() {
          view.backgroundColor = .white
          view.addSubview(nameTextField)
          view.addSubview(userTextField)
          view.addSubview(senhaTextField)
          view.addSubview(registerButton)
          view.addSubview(subTitleLabel)
          view.addSubview(vamosComecarLabel)
          view.addSubview(iconPerson)
          view.addSubview(iconPassword)
          view.addSubview(iconApp)
          view.addSubview(setImageLabel)
          view.addSubview(iconNAme)
          view.addSubview(returnView)
        // Adicione a implementação do setupView aqui
     }
    
   

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageSelected = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        iconApp.image = imageSelected
        imagePicker.dismiss(animated: true)
    }

    
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            // coloque aqui suas constraints

            returnView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            returnView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            returnView.heightAnchor.constraint(equalToConstant: 50),
            returnView.widthAnchor.constraint(equalToConstant: 50),
            
            vamosComecarLabel.topAnchor.constraint(equalTo: returnView.bottomAnchor, constant: 40),
            vamosComecarLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            subTitleLabel.topAnchor.constraint(equalTo: vamosComecarLabel.bottomAnchor, constant: 2),
            subTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            
            iconApp.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 30),
            iconApp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconApp.heightAnchor.constraint(equalToConstant: 100),
            iconApp.widthAnchor.constraint(equalToConstant: 100),
            
            setImageLabel.topAnchor.constraint(equalTo: iconApp.bottomAnchor, constant: 15),
            setImageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: setImageLabel.bottomAnchor, constant: 70),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            userTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 35),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            
            senhaTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 35),
            senhaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            senhaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            senhaTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: senhaTextField.bottomAnchor, constant: 70),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        
            
            
            iconNAme.topAnchor.constraint(equalTo: nameTextField.topAnchor),
            iconNAme.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor, constant: -30),
            iconNAme.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            iconNAme.widthAnchor.constraint(equalToConstant:  25),
            
            
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
        textField.resignFirstResponder()
        textField.autocorrectionType = .no
        textField.backgroundColor = .black
        textField.addDoneButtonOnKeyboard()
       
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addDoneButtonOnKeyboard()
        let placeholderText = "Digite o seu nome"
        let attributes: [NSAttributedString.Key: Any] = [
           .foregroundColor: UIColor.lightGray              ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .white
        textField.delegate = self
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
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
        textField.addDoneButtonOnKeyboard()
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.delegate = self
        textField.keyboardType = .default
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.resignFirstResponder()
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.backgroundColor = .black
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    
    
    lazy var iconApp : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName:  "person.badge.plus")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(tapGesture)
        imageView.layer.cornerRadius = 35
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var returnView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName:  "arrowshape.backward")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(returnToLogin))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    @objc func selectImage() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
   
    @objc func returnToLogin() {
        self.onReturnToLogin?()
    }
    
    @objc func onLoginTapped() {
        self.showLoadingView()
        let name     = nameTextField.text ?? ""
        let email    = userTextField.text ?? ""
        let password = senhaTextField.text ?? ""
        let image    = iconApp.image ?? UIImage()
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
    
    

    
    lazy var vamosComecarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Vamos começar seu cadastro"
        label.font = UIFont(name: "Pacifico", size: 28)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preencha o formulario abaixo:"
        label.font = UIFont(name: "Pacifico", size: 19)
        label.textColor = .black
        return label
    }()
    
    lazy var setImageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Caso prefira selecione uma foto no icone acima:"
        label.font = UIFont(name: "Pacifico", size: 15)
        label.textColor = .black
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
    
    lazy var iconNAme: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.text.rectangle.fill")
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
