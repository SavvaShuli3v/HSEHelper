//
//  MainImageTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 01.01.2022.
//

import UIKit

final class MainImageTableViewCell: UITableViewCell {
    private lazy var mainImageView = makeImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        addSubview(mainImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame = bounds
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = .clear
    return imageView
}
