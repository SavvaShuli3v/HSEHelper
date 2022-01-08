//
//  MainNameTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 01.01.2022.
//

import UIKit

final class MainNameTableViewCell: UITableViewCell {
    private lazy var mainLabel = makeMainLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(mainLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainLabel.frame = bounds
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    return label
}
