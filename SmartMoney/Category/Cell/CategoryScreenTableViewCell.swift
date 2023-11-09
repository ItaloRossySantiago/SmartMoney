//
//  CategoryScreenTableViewCell.swift
//  SmartMoney
//
//  Created by Italo on 08/11/23.
//

import UIKit

class CategoryScreenTableViewCell: UIView {
    
    lazy var categoryImageView:  UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "fork.knife.circle.fill")
        image.tintColor = .systemRed
        image.clipsToBounds = true
        return image
    }()
    
    lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "OpenSansCondensed-Medium", size: 20)
        return label
    }()
    
    lazy var deleteImageView:  UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "trash")
        image.tintColor = .black
        return image
    }()
    
    lazy var editImageView:  UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "pencil.line")
        image.tintColor = .black
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        setupConstraints()
        
    }
    
    private func configSuperView() {
        addSubview(categoryImageView)
        addSubview(categoryNameLabel)
        addSubview(deleteImageView)
        addSubview(editImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoryImageView.heightAnchor.constraint(equalToConstant: 40),
            categoryImageView.widthAnchor.constraint(equalToConstant: 40),
            
            categoryNameLabel.centerYAnchor.constraint(equalTo: categoryImageView.centerYAnchor, constant: 5),
            categoryNameLabel.leadingAnchor.constraint(equalTo: categoryImageView.trailingAnchor, constant: 10),
            
            deleteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deleteImageView.centerYAnchor.constraint(equalTo: categoryNameLabel.centerYAnchor),
            deleteImageView.heightAnchor.constraint(equalToConstant: 25),
            deleteImageView.widthAnchor.constraint(equalToConstant: 25),
            
            editImageView.trailingAnchor.constraint(equalTo: deleteImageView.leadingAnchor, constant: -10),
            editImageView.centerYAnchor.constraint(equalTo: categoryNameLabel.centerYAnchor),
            editImageView.heightAnchor.constraint(equalToConstant: 25),
            editImageView.widthAnchor.constraint(equalToConstant: 25),
            
        ])
    }
}
