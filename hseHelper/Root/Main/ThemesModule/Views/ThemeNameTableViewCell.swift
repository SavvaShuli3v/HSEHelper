//
//  ThemeNameTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 23.12.2021.
//

import UIKit

final class ThemeNameTableViewCell: UITableViewCell {
    
    private lazy var mainLabel = makeLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(mainLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainLabel.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width, height: 22)
        )
    }
}

private func makeLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    return label
}
