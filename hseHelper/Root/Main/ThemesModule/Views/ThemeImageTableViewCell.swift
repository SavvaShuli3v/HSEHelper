//
//  ThemeImageTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 23.12.2021.
//

import UIKit

final class ThemeImageTableViewCell: UITableViewCell {
    
    private lazy var mainImageView = makeImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(mainImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame = CGRect(
            origin: CGPoint(x: 0, y: bounds.height - bounds.width / 3),
            size: CGSize(width: bounds.width, height: bounds.width / 3))
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = AppColors.lightGray
    return imageView
}
