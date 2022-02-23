//
//  UserMailTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 20.02.2022.
//

import UIKit

final class UserMailTableViewCell: UITableViewCell {
    private lazy var mainView = makeContentView()
    private lazy var mainLabel = makeLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(mainView)
        addSubview(mainLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        mainLabel.text = text
    }
    
    private func setupConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.top(16)
        mainView.trailing(-16)
        mainView.leading(16)
        mainView.bottom(-16)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainLabel.leading(26)
        mainLabel.trailing(-26)
    }
}

private func makeContentView() -> UIView {
    let view = UIView()
    view.layer.cornerRadius = 20
    view.backgroundColor = .clear
    view.layer.borderWidth = 1
    view.alpha = 0.25
    view.layer.borderColor = UIColor.Pallete.lightGray.cgColor
    return view
}

private func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .Pallete.lightGray
    label.font = .systemFont(ofSize: 18, weight: .light)
    label.textAlignment = .center
    return label
}
