//
//  ThemesTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 23.12.2021.
//

import UIKit

protocol ThemesTableViewCellProtocol: AnyObject {
    func showArticle()
}

final class ThemesTableViewCell: UITableViewCell {
    
    weak var delegate: ThemesTableViewCellProtocol?
    
    private lazy var themeLabel = makeMainLabel()
    private lazy var lineView = makeLine()
    private lazy var numberLabel = makeNumber()
    private lazy var mainButton = makeMainButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(themeLabel)
        addSubview(lineView)
        addSubview(numberLabel)
        contentView.addSubview(mainButton)
        
        mainButton.setAction { [weak self] in
            self?.delegate?.showArticle()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with str: String, indexPath: IndexPath) {
        themeLabel.text = str
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
        
        mainButton.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: bounds.width, height: bounds.height - 1)
        )
    }
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.textColor = UIColor.Pallete.black
    label.text = "Some text"
    return label
}

private func makeLine() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.Pallete.lightGray
    view.layer.cornerRadius = 0.2
    return view
}

private func makeNumber() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.textColor = UIColor.Pallete.black
    label.text = "1."
    return label
}

private func makeMainButton() -> TableViewButton {
    let button = TableViewButton()
    button.backgroundColor = .clear
    return button
}
