//
//  ListCollectionViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 28.12.2021.
//

import UIKit

protocol ListCollectionViewCellProtocol: AnyObject {
    func showThemeFromNews()
}

final class ListCollectionViewCell: UICollectionViewCell {
    weak var delegate: ListCollectionViewCellProtocol?
    private var content: UIView?
    
    private lazy var mainImageView = makeImageView()
    private lazy var mainLabel = makeMainLabel()
    private lazy var mainButton = makeMainButton()
    private lazy var clearButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(mainImageView)
        mainImageView.layer.cornerRadius = 5
        addSubview(mainButton)
        addSubview(mainLabel)
        addSubview(clearButton)
        setConstraints()
        
        mainButton.setAction { [weak self] in
            self?.delegate?.showThemeFromNews()
        }
        
        clearButton.addTarget(self, action: #selector(touchEnded), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func touchEnded() {
        delegate?.showThemeFromNews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame = CGRect(
            origin: CGPoint(x: 16, y: 8),
            size: CGSize(width: 300, height: 150)
        )
    }
    
    func setObject(view: UIView) {
        
    }
    
    private func setConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leading(16)
        mainLabel.width(300)
        mainLabel.top(10, to: mainImageView.bottomAnchor)
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.top(10, to: mainLabel.bottomAnchor)
        mainButton.leading(16)
        mainButton.height(30)
        mainButton.width(100)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.top(8)
        clearButton.leading(16)
        clearButton.width(300)
        clearButton.bottom(to: mainLabel.bottomAnchor)
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemOrange
    return imageView
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 2
    label.text = "Как сдать БЖД на 10! Новая статья для студентов"
    label.textColor = UIColor.Pallete.black
    return label
}

private func makeMainButton() -> TableViewButton {
    let button = TableViewButton()
    button.setTitle("Читать", for: .normal)
    button.setTitleColor(UIColor.Pallete.lightGray, for: .normal)
    button.layer.cornerRadius = 15
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.Pallete.lightGray.cgColor
    return button
}

private func makeClearButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .clear
    return button
}
