//
//  ListTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

final class ListTableViewCell: UITableViewCell {
    
    private lazy var topicLabel = makeTopicLabel()
    private lazy var topicImageView = makeTopicImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
    }
}

extension ListTableViewCell {
    private func setupCell() {
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(topicLabel)
        addSubview(topicImageView)
    }
    
    private func layoutView() {
        topicLabel.frame = CGRect(
            origin: CGPoint(x: 56, y: 16),
            size: CGSize(width: bounds.width - 80, height: 20)
        )
        
        topicImageView.frame = CGRect(
            origin: CGPoint(x: 16, y: 15),
            size: CGSize(width: 40, height: 40)
        )
    }
}

private func makeTopicLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.text = "Здесь будет название темы"
    label.textColor = .black
    label.font = .systemFont(ofSize: 16, weight: .bold)
    return label
    
}

private func makeTopicImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = .green
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}
