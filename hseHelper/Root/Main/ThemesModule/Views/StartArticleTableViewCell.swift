//
//  StartArticleTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 27.12.2021.
//

import UIKit

protocol StartArticleTableViewCellProtocol: AnyObject {
    func showArtcile()
}

final class StartArticleTableViewCell: UITableViewCell {
    weak var delegate: StartArticleTableViewCellProtocol?
    
    private lazy var mainButton = makeButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.addSubview(mainButton)
        
        mainButton.setAction { [weak self] in
            self?.delegate?.showArtcile()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainButton.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width - 32, height: 52)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private func makeButton() -> StartAnimatedButton {
    let button = StartAnimatedButton()
    button.backgroundColor = UIColor.Pallete.lightPurple
    button.setTitle("Читать статью", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    return button
}
