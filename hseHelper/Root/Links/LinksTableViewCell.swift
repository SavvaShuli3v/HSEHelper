//
//  LinksTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.01.2022.
//

import UIKit

final class LinksTableViewCell: UITableViewCell {
    private lazy var mainImageView = makeImageView()
    private lazy var mainView = makeMainView()
    private lazy var mainLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(mainImageView)
        addSubview(mainView)
        addSubview(mainLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainInfo(_ text: String) {
        mainLabel.text = text
    }
    
    private func setConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.top()
        mainImageView.leading(8)
        mainImageView.trailing(-8)
        mainImageView.height(100)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.top(to: mainImageView.bottomAnchor)
        mainView.leading(8)
        mainView.trailing(-8)
        mainView.height(100)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leading(8, to: mainView.leadingAnchor)
        mainLabel.trailing(-8, to: mainView.trailingAnchor)
        mainLabel.top(16, to: mainView.topAnchor)
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.roundCorners(.top, radius: radius)
    imageView.backgroundColor = .red
    return imageView
}

private func makeMainView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.Pallete.gray
    view.roundCorners(.bottom, radius: radius)
    return view
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .bold)
    return label
}

private let radius: CGFloat = 10
