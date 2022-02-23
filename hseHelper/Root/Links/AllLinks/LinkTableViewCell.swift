//
//  LinkTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.01.2022.
//

import UIKit

final class LinkTableViewCell: UITableViewCell {
    private lazy var mainLabel = makeMainLabel()
    private lazy var lineView = makeLineView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .Pallete.white
        selectionStyle = .none
        addSubview(mainLabel)
        addSubview(lineView)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        lineView.frame = CGRect(
            origin: CGPoint(x: 16, y: bounds.height - 1),
            size: CGSize(width: bounds.width - 32, height: 0.4)
        )
    }
    
    private func setupUI() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        mainLabel.leading(16)
        mainLabel.text = "ЛМС и смарт слмс"
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .Pallete.black
    return label
}

private func makeLineView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.Pallete.lightGray
    view.layer.cornerRadius = 0.2
    return view
}
