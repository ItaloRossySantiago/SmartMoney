import Foundation
import UIKit

class CardViewController: UIViewController {
    let viewModel = CardViewModel()
    
    var returnToHomeClousure:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewProtocols()
        setupView()
        setupConstraints()
        hideKeyBoardWhenTappedAround()
        view.backgroundColor = UIColor(hexString: "#dde4e6")
    }
    
    
    private func setupView() {
        view.addSubview(returnButton)
        view.addSubview(titleLabel)
        view.addSubview(newCardButton)
        view.addSubview(panelList)
        panelList.addSubview(listTableView)
    }
    
    public func configTableViewProtocols() {
        listTableView.delegate   = self
        listTableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            returnButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            returnButton.heightAnchor.constraint(equalToConstant: 50),
            returnButton.widthAnchor.constraint(equalToConstant: 50),
            
            titleLabel.centerYAnchor.constraint(equalTo: returnButton.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            newCardButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            newCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            newCardButton.widthAnchor.constraint(equalToConstant: 50),
            newCardButton.heightAnchor.constraint(equalToConstant: 50),
            
            panelList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            panelList.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            panelList.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            panelList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            
            listTableView.topAnchor.constraint(equalTo: panelList.topAnchor, constant: 5),
            listTableView.bottomAnchor.constraint(equalTo: panelList.bottomAnchor, constant: -5),
            listTableView.leadingAnchor.constraint(equalTo: panelList.leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: panelList.trailingAnchor),
    
        ])
    }
    
    lazy var returnButton : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName:  "arrowshape.backward")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(returnToHome))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lista de Cartões"
        label.font = UIFont.openSansBold
        
        return label
    }()
    
    lazy var newCardButton:  UIImageView = {
        let image = UIImageView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(insertNewCard))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image =  UIImage(systemName: "plus.circle.fill")
        image.tintColor = .green
        image.backgroundColor = .white
        image.layer.borderColor = UIColor.green.cgColor
        image.layer.borderWidth = 5
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    
    lazy var panelList: UIView = {
        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.clipsToBounds = true
        panel.layer.cornerRadius = 20
        panel.backgroundColor = .white
        return panel
    }()
    
    lazy var listTableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        return tableView
    }()

    
    
    
    @objc func returnToHome() {
        self.returnToHomeClousure?()
    }
    
    @objc func insertNewCard() {
        //  self.returnToHomeClousure?()
        print("Inserir cartão")
    }
    
}


extension CardViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as? CardTableViewCell
        cell?.setupCardCell()
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
}
