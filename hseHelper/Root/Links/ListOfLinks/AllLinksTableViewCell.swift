//
//  AllLinksTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.01.2022.
//

import UIKit

protocol AllLinksTableViewCellAnswer: AnyObject {
    func tappedToButton()
}

final class AllLinksTableViewCell: UITableViewCell {
    weak var delegate: AllLinksTableViewCellAnswer?
    
    private lazy var mainView = UIView()
    private lazy var mainLabel = UILabel()
    private lazy var mainButton = LinkAnimatedButton()
    private let gradient = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = mainView.bounds
    }
    
    private func setupUI() {
        addSubview(mainView)
        addSubview(mainLabel)
        contentView.addSubview(mainButton)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        
        mainView.leading(16)
        mainView.trailing(-16)
        mainView.bottom(-16)
        mainView.top(16)
        mainView.backgroundColor = .Pallete.gray
        mainView.layer.cornerRadius = 16
        
        
        gradient.colors = [UIColor.Pallete.lightPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.cornerRadius = 16
        mainView.layer.insertSublayer(gradient, at: 10)
        
        
        mainLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        mainLabel.text = "Все ссылки"
        mainLabel.textColor = .white
        
        mainButton.leading(to: mainView.leadingAnchor)
        mainButton.trailing(to: mainView.trailingAnchor)
        mainButton.top(to: mainView.topAnchor)
        mainButton.bottom(to: mainView.bottomAnchor)
        mainButton.layer.cornerRadius = 16
        
        mainButton.setAction { [weak self] in
            self?.delegate?.tappedToButton()
        }
    }
}
