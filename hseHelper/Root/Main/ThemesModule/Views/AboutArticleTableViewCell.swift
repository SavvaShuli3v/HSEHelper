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
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setMainText(_ text: String) {
        mainLabel.text = text
    }
    
    func settaskText(_ text: String) {
        taskLabel.text = text
    }
    
    private func setConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leading(16)
        mainLabel.trailing(-16)
        mainLabel.top(16)
        
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.leading(16)
        taskLabel.trailing(-16)
        taskLabel.top(14, to: mainLabel.bottomAnchor)
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    label.numberOfLines = 0
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
