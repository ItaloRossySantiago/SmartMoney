//
//  HomeViewController.swift
//  Controlador da tela
//
//  Criado por Italo Rossy em 19/06/23.
//

import UIKit
import FirebaseStorageUI

class HomeViewController: UIViewController {
    let homeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configConstraints()
        hideKeyBoardWhenTappedAround()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        homeViewModel.importUserData  { result in
            self.setupUser(result["nome"] ?? "" , result["url_img"] ?? "")
        }
    }
    
    // CLOUSURES
    // var ontappedSelectImage:(() -> Void)?
    var onLogoffTappedClouser:(() -> Void)?
    var onInsertExpenseTappedClouser:(() ->Void)?
    private func setupView() {
        view.backgroundColor = UIColor(hexString: "#dde4e6")
        
        
        view.addSubview(panel)
        view.addSubview(helloLabel)
        view.addSubview(userName)
        view.addSubview(profileImageView)
        view.addSubview(logoffImageView)
        view.addSubview(logoffLabel)
        view.addSubview(newGastoImageView)
        view.addSubview(incluirDespLabel)
        panel.superview?.addSubview(criarContaLabel)
        panel.superview?.addSubview(despesasLabel)
        //panel.setCardShadow()
        
        view.addSubview(panelList)
        //panelList.setCardShadow()
        panelList.superview?.addSubview(listDespesasLabel)
        panelList.addSubview(verTudoLabel)
        
        
        
        // Adicione a implementação do setupView aqui
    }
    
    private func setupUser(_ name:String, _ url_img: String ) {
        userName.text = name
        profileImageView.sd_setImage(with: URL(string: url_img), completed: nil)
    }
    
    lazy var panel: UIView = {
        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.clipsToBounds = true
        panel.layer.cornerRadius = 20
        panel.backgroundColor = .white
        return panel
    }()
    
    lazy var criarContaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "OpenSansCondensed-Medium", size: 35)
        label.text = "R$ 5.000,00"
        if let color = UIColor(hexString: "#6295d9") {
            label.textColor = .systemRed
        }
        //  label.font = UIFont.systemFont(ofSize: 30)
        label.layer.shadowOpacity = 0
        
        return label
    }()
    
    lazy var despesasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.openSansBold
        label.text = "Suas Despesas"
        label.textColor = .black
        return label
    }()
    
    lazy var listDespesasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.openSansBold
        label.text = "Ultimas despesas"
        label.textColor = .black
        return label
    }()
    
    lazy var profileImageView:  UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 35
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var logoffImageView:  UIImageView = {
        let image = UIImageView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logoffAction))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image =  UIImage(systemName: "person.crop.circle.fill.badge.xmark")
        image.isUserInteractionEnabled = true
        image.tintColor = .black
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    
    lazy var newGastoImageView:  UIImageView = {
        let image = UIImageView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(insertExpenseAction))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 35
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image =  UIImage(systemName: "plus.circle.fill")
        image.tintColor = .red
        image.backgroundColor = .white
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.borderWidth = 8
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    
    @objc func insertExpenseAction() {
        print("tetinha")
        self.onInsertExpenseTappedClouser?()
    }
    
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Ola,"
        label.font =  UIFont(name: "OpenSansSemiCondensed-Light", size: 14)
        return label
    }()
    
    lazy var logoffLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Logout"
        label.font =  UIFont(name: "OpenSansCondensed-Medium", size: 16)
        return label
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont(name: "OpenSansCondensed-Medium", size: 20)
        return label
    }()
    
    lazy var incluirDespLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.openSansBold
        label.text = "Incluir Nova"
        label.textColor = .black
        return label
    }()
    
    lazy var panelList: UIView = {
        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.clipsToBounds = true
        panel.layer.cornerRadius = 20
        panel.backgroundColor = .white
        return panel
    }()
    
    lazy var verTudoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "ver tudo"
        label.font =  UIFont(name: "OpenSansCondensed-Medium", size: 16)
        label.textColor = .systemBlue
        return label
    }()
    
    @objc func logoffAction() {
        homeViewModel.signOutUser()
        self.onLogoffTappedClouser?()
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            // coloque aqui suas constraints
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 60),
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            helloLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 5),
            helloLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            
            logoffImageView.widthAnchor.constraint(equalToConstant: 40),
            logoffImageView.heightAnchor.constraint(equalToConstant: 40),
            logoffImageView.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            logoffImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            logoffLabel.topAnchor.constraint(equalTo: logoffImageView.bottomAnchor, constant: 3),
            logoffLabel.centerXAnchor.constraint(equalTo: logoffImageView.centerXAnchor),
            
            
            userName.topAnchor.constraint(equalTo: helloLabel.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 7),
            
            
            panel.topAnchor.constraint(equalTo: view.topAnchor),
            panel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            panel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            panel.heightAnchor.constraint(equalToConstant: 300),
            
            
            
            criarContaLabel.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            criarContaLabel.topAnchor.constraint(equalTo: despesasLabel.bottomAnchor, constant: 3),
            
            despesasLabel.topAnchor.constraint(equalTo: panel.topAnchor, constant: 125),
            despesasLabel.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            
            incluirDespLabel.topAnchor.constraint(equalTo: newGastoImageView.topAnchor, constant: -35),
            incluirDespLabel.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            
            
            
            newGastoImageView.widthAnchor.constraint(equalToConstant: 70),
            newGastoImageView.heightAnchor.constraint(equalToConstant: 70),
            newGastoImageView.topAnchor.constraint(equalTo: panel.bottomAnchor,constant: -27),
            newGastoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            panelList.topAnchor.constraint(equalTo: newGastoImageView.bottomAnchor, constant: 15),
            panelList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            panelList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            panelList.heightAnchor.constraint(equalToConstant: 250),
            
            listDespesasLabel.topAnchor.constraint(equalTo: panelList.topAnchor, constant: 10),
            listDespesasLabel.leadingAnchor.constraint(equalTo: panelList.leadingAnchor, constant: 20),
            
            verTudoLabel.centerYAnchor.constraint(equalTo: listDespesasLabel.centerYAnchor),
            verTudoLabel.trailingAnchor.constraint(equalTo: panelList.trailingAnchor, constant: -20),
            
        ])
    }
}
