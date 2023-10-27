//
//  HomeScreenCustomTableViewcell.swift
//  SmartMoney
//
//  Created by Italo on 26/10/23.
//

import UIKit

class HomeScreenCustomTableViewCell: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.systemFont(ofSize: 14)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        setupConstraints()

    }
    
    private func configSuperView() {
        addSubview(descriptionLabel)
        addSubview(dateLabel)
        addSubview(valueLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            
        ])
    }
}
