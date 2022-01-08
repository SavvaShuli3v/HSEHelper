//
//  ListTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

protocol ListTableViewCellProtocol: AnyObject {
    func cellTapped()
}

final class ListTableViewCell: UITableViewCell {
    weak var delegate: ListTableViewCellProtocol?
    private var aboutText: String? {
        willSet {
            aboutLabel.text = newValue
        }
    }
    
    private var longTopic = false
        
    private lazy var topicLabel = makeTopicLabel()
    private lazy var aboutLabel = makeAboutLabel()
    private lazy var topicImageView = makeTopicImageView()
    private lazy var animatedButton = TableViewButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addSubviews()
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutView()
    }
    
    func setData(with model: ThemeModel) {
        topicLabel.text = model.themeName
        aboutText = model.additionalInf
        topicImageView.image = model.image
        
        if model.themeName.count > 20 {
            longTopic = true
        }
    }
}

extension ListTableViewCell {
    private func setupCell() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupButton() {
        animatedButton.setAction { [weak self] in
            self?.delegate?.cellTapped()
        }
    }
    
    private func addSubviews() {
        addSubview(topicLabel)
        addSubview(aboutLabel)
        addSubview(topicImageView)
        contentView.addSubview(animatedButton)
    }
}

private extension ListTableViewCell {
    func layoutView() {
        if aboutText == nil {
            if longTopic {
                set2LineTopicFrame()
            } else {
                setCentreTopicLabelFrame()
            }
            aboutLabel.frame = .zero
        } else {
            setUpTopicLabelFrame()
            setAboutLabelFrame()
        }
        setTopicImageViewFrame()
        animatedButton.frame = bounds
    }
    
    func set2LineTopicFrame() {
        topicLabel.frame = CGRect(
            origin: CGPoint(x: 86, y: 11),
            size: CGSize(width: bounds.width - 80, height: 56)
        )
    }
    
    func setCentreTopicLabelFrame() {
        topicLabel.frame = CGRect(
            origin: CGPoint(x: 86, y: 27),
            size: CGSize(width: bounds.width - 80, height: 22)
        )
    }
    
    func setUpTopicLabelFrame() {
        topicLabel.frame = CGRect(
            origin: CGPoint(x: 86, y: 16),
            size: CGSize(width: bounds.width - 80, height: 22)
        )
    }
    
    func setAboutLabelFrame() {
        aboutLabel.frame = CGRect(
            origin: CGPoint(x: 86, y: 44),
            size: CGSize(width: bounds.width - 80, height: 18)
        )
    }
    
    func setTopicImageViewFrame() {
        topicImageView.frame = CGRect(
            origin: CGPoint(x: 18, y: 15),
            size: CGSize(width: 50, height: 50)
        )
    }
}

private func makeTopicLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.textColor = UIColor.Pallete.black
    label.font = .systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 2
    return label
}

private func makeAboutLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.textColor = UIColor.Pallete.lightGray
    label.font = .systemFont(ofSize: 18, weight: .light)
    return label
}

private func makeTopicImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = UIColor.Pallete.lightGray
    imageView.layer.cornerRadius = 10
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    return imageView
}
