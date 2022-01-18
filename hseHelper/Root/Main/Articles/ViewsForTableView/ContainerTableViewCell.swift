//
//  ContainerTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 18.01.2022.
//

import UIKit

final class ContainerTableViewCell<T: UIView>: UITableViewCell {
    let view: T
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.view = T()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(view)
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = bounds
    }
}
