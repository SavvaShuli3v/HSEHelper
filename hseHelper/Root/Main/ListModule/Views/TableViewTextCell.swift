//
//  TableViewTextCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 21.12.2021.
//

import UIKit

final class TableViewTextCell: UITableViewCell {
    
    private lazy var mainLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addUILabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(with text: String) {
        mainLabel.text = text
    }
    
    private func addUILabel() {
        addSubview(mainLabel)
        mainLabel.text = "Самое важное"
        mainLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        mainLabel.textColor = UIColor.Pallete.black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainLabel.frame = CGRect(
            origin: CGPoint(x: 18, y: 18),
            size: CGSize(width: bounds.width - 32, height: 24)
        )
    }
    
}
