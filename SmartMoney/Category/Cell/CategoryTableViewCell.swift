//
//  CardTableViewCell.swift
//  SmartMoney
//
//  Created by Italo on 08/11/23.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier: String = "CategoryTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
    }
    
    lazy var screen: CategoryScreenTableViewCell = {
        let view = CategoryScreenTableViewCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private func addSubView() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    public func setupCategoryCell(data:CategoryModel) {
        screen.categoryNameLabel.text = data.categoryName
    }
}
