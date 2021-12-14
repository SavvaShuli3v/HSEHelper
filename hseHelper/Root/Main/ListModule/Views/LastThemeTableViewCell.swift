//
//  LastThemeTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

final class LastThemeTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
