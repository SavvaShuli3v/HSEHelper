//
//  LinksTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.01.2022.
//

import UIKit

final class LinksTableViewCell: UITableViewCell {
    private lazy var mainImageView = makeImageView()
    private lazy var mainLabel = makeMainLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(mainImageView)
        addSubview(mainLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLinksObject(_ object: ListOfLinksModel) {
        mainLabel.text = object.nameOfLinks
        mainImageView.image = object.image
    }
    
    func configure(_ imageViewColor: UIColor) {
        mainImageView.backgroundColor = imageViewColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width - 32, height: bounds.height - 32)
        )
    }
    
    private func setConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leading(50, to: leadingAnchor)
        mainLabel.top(44, to: topAnchor)
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.roundCorners(.all, radius: 16)
    imageView.backgroundColor = .Pallete.white
    return imageView
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .white
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 26, weight: .bold)
    return label
}

private let radius: CGFloat = 10
