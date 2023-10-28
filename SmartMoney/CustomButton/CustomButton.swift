//
//  CustomButton.swift
//  SmartMoney
//
//  Created by Italo on 27/10/23.
//

import Foundation
import UIKit
class CustomButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configConstraints()
    }
    
    func setupButton(image:UIImage,textButton:String) {
        icon.image = image
        label.text = textButton
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var panel : UIView = {
        let panel = UIView()
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = .white
        panel.clipsToBounds = true
        panel.layer.cornerRadius = 12
        return panel
    }()
    
    lazy var button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .none

        return button
    }()
    
    lazy var icon : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: "OpenSansCondensed-Medium", size: 20)
        return label
    }()
    
    private func setupView(){
        addSubview(panel)
        panel.addSubview(icon)
        panel.addSubview(label)
        panel.addSubview(button)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            panel.topAnchor.constraint(equalTo: topAnchor),
            panel.bottomAnchor.constraint(equalTo: bottomAnchor),
            panel.leadingAnchor.constraint(equalTo: leadingAnchor),
            panel.trailingAnchor.constraint(equalTo: trailingAnchor),
            panel.heightAnchor.constraint(equalToConstant: 130),
            panel.widthAnchor.constraint(equalToConstant: 130),
            
            icon.topAnchor.constraint(equalTo: panel.topAnchor, constant: 20),
            icon.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            icon.widthAnchor.constraint(equalToConstant: 40),
            icon.heightAnchor.constraint(equalToConstant: 40),
            
            label.bottomAnchor.constraint(equalTo: panel.bottomAnchor, constant: -18),
            label.centerXAnchor.constraint(equalTo: panel.centerXAnchor),
            
            button.topAnchor.constraint(equalTo:     panel.topAnchor),
            button.bottomAnchor.constraint(equalTo:  panel.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: panel.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: panel.trailingAnchor),
            
        ])
    }
    
}
