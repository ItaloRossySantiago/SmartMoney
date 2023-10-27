//
//  HomeCustomCell.swift
//  SmartMoney
//
//  Created by Italo on 26/10/23.
//

import UIKit

class HomeCustomTableViewCell: UITableViewCell {
    
    static let identifier: String = "HomeCustomTableViewCell"

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
    }
    
    lazy var screen: HomeScreenCustomTableViewCell = {
        let view = HomeScreenCustomTableViewCell()
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
    
    public func setupHomeCell(data: ExpenseModel) {
        screen.descriptionLabel.text = "Descrição: \(data.description)"
        screen.dateLabel.text = "Data: \(data.dateExpense)"
        screen.valueLabel.text = "R$\(data.valueExpense)"
    }
}
