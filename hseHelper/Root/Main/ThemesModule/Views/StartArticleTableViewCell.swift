//
//  StartArticleTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 27.12.2021.
//

import UIKit

final class StartArticleTableViewCell: UITableViewCell {
    
    private lazy var mainButton = makeButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(mainButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainButton.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width - 32, height: 46)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private func makeButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = AppColors.lightPurple
    button.setTitle("Читать статью", for: .normal)
    button.setTitleColor(AppColors.white, for: .normal)
    button.layer.cornerRadius = 8
    return button
}
