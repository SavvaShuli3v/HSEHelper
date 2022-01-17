//
//  AboutArticleTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 27.12.2021.
//

import UIKit

final class AboutArticleTableViewCell: UITableViewCell {
    
    private lazy var mainLabel = makeMainLabel()
    private lazy var taskLabel = makeTaskLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(mainLabel)
        addSubview(taskLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainLabel.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width - 32, height: 40)
        )
        
        taskLabel.frame = CGRect(
            origin: CGPoint(x: 16, y: 52),
            size: CGSize(width: bounds.width - 32, height: 80)
        )
    }
    
    func setMainText(_ text: String) {
        mainLabel.text = text
    }
    
    func settaskText(_ text: String) {
        taskLabel.text = text
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    label.textColor = UIColor.Pallete.black
    return label
}

private func makeTaskLabel() -> UILabel {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 0
    label.textColor = UIColor.Pallete.lightGray
    
    return label
}
