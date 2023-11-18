//
//  CardTableViewCell.swift
//  SmartMoney
//
//  Created by Italo on 08/11/23.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    static let identifier: String = "CardTableViewCell"
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
    }
    
    lazy var screen: CardScreenTableViewCell = {
        let view = CardScreenTableViewCell()
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
    
    public func setupCardCell(data: CardModel) {
        screen.cardNameLabel.text = data.cardName
    }
}
