import Foundation
import UIKit

class CategoryViewController: UIViewController {
    let viewModel = CategoryViewModel()
    //MARK Clousure
    var returnToHomeClousure:(() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableViewProtocols()
        setupView()
        setupConstraints()
        hideKeyBoardWhenTappedAround()
        view.backgroundColor = UIColor(hexString: "#dde4e6")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.delegate(delegate: self)
        viewModel.getListCategory()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getListCategory()
    }
    
    private func setupView() {
        view.addSubview(returnButton)
        view.addSubview(titleLabel)
        view.addSubview(newCategoryButton)
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
            
            newCategoryButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            newCategoryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            newCategoryButton.widthAnchor.constraint(equalToConstant: 50),
            newCategoryButton.heightAnchor.constraint(equalToConstant: 50),
            
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
        label.text = "Lista de Categorias"
        label.font = UIFont.openSansBold
        
        return label
    }()
    
    lazy var newCategoryButton:  UIImageView = {
        let image = UIImageView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(insertNewCategory))
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
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        return tableView
    }()

    
    @objc func returnToHome() {
        self.returnToHomeClousure?()
    }
    @objc func insertNewCategory() {
        //  self.returnToHomeClousure?()
        print("Inserir categoria")
    }
    
}

extension CategoryViewController : CategoryViewModelProtocol {
    
    func sucessGetListCategory(listCategory: CategoryList) {
        configTableViewProtocols()
        listTableView.reloadData()
    }
    
    func errorGetListCategory() {
        //fazer alert
    }
    
}



extension CategoryViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.setupCategoryCell(data: viewModel.loadCurrentCategory(indexPath: indexPath))
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
}
