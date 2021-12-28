//
//  ThemesTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 23.12.2021.
//

import UIKit

final class ThemesTableViewCell: UITableViewCell {
    
    private lazy var themeLabel = makeMainLabel()
    private lazy var lineView = makeLine()
    private lazy var numberLabel = makeNumber()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(themeLabel)
        addSubview(lineView)
        addSubview(numberLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with model: ArticleModel, indexPath: IndexPath) {
        themeLabel.text = model.name
        numberLabel.text = String(indexPath.row + 1) + "."
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        themeLabel.frame = CGRect(
            origin: CGPoint(x: 42, y: 22),
            size: CGSize(width: bounds.width - 24, height: 18)
        )
        
        lineView.frame = CGRect(
            origin: CGPoint(x: 42, y: bounds.height),
            size: CGSize(width: bounds.width - 60, height: 0.4)
        )
        
        numberLabel.frame = CGRect(
            origin: CGPoint(x: 16, y: 22),
            size: CGSize(width: 20, height: 18)
        )
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.textColor = AppColors.white
    label.text = "Some text"
    return label
}

private func makeLine() -> UIView {
    let view = UIView()
    view.backgroundColor = AppColors.lightGray
    view.layer.cornerRadius = 0.2
    return view
}

private func makeNumber() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.textColor = AppColors.white
    label.text = "1."
    return label
}
