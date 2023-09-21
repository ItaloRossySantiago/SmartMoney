//
//  LoadingView.swift
//  SmartMoney
//
//  Created by Italo on 30/08/23.
//

import UIKit

class LoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(imageApp)
        addSubview(imageLoading)
        addSubview(msgLoadingLabel)
        backgroundColor = .white
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageApp.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            imageApp.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            imageApp.heightAnchor.constraint(equalToConstant: 150),
            imageApp.widthAnchor.constraint(equalToConstant: 150),
            
            imageLoading.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageLoading.topAnchor.constraint(equalTo: imageApp.bottomAnchor, constant: 15),
            imageLoading.heightAnchor.constraint(equalToConstant: 50),
            imageLoading.widthAnchor.constraint(equalToConstant: 50),
            
            msgLoadingLabel.topAnchor.constraint(equalTo: imageLoading.bottomAnchor, constant: 15),
            msgLoadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
    }
    
    lazy var imageApp: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "iconApp")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var imageLoading: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage.gifImageWithName("SmartMoney")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var msgLoadingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SmartMoney"
        label.font = UIFont(name: "Pacifico", size: 39)
        label.textColor =  .black
        return label
    }()
    
}
