//
//  SimpleProfileCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

protocol SimpleProfileCellProtocol: AnyObject {
    func didTapToButton(with indexPath: IndexPath)
}

final class SimpleProfileCell: UITableViewCell {
    weak var answerDelegate: SimpleProfileCellProtocol?
    private var index: IndexPath?
    
    private lazy var nameOfCell = makeLabel()
    private lazy var simpleImage = makeSimpleImage()
    private lazy var simpleButton = TableViewButton()
    private lazy var line = makeLine()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(nameOfCell)
        addSubview(simpleImage)
        addSubview(line)
        contentView.addSubview(simpleButton)
        setLayouts()
        
        simpleButton.setAction { [weak self] in
            guard let index = self?.index else {
                return
            }
            self?.answerDelegate?.didTapToButton(with: index)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        line.frame = CGRect(
            origin: CGPoint(x: 16, y: bounds.height - 1),
            size: CGSize(width: bounds.width - 32, height: 0.4)
        )
        
        simpleButton.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: bounds.width, height: bounds.height - 1))
        
    }
    
    func setIndex(indexPath: IndexPath) {
        self.index = indexPath
    }
    
    func setNameCell(with text: String) {
        nameOfCell.text = text
    }
    
    private func setLayouts() {
        nameOfCell.translatesAutoresizingMaskIntoConstraints = false
        nameOfCell.leading(16)
        nameOfCell.trailing(-16)
        nameOfCell.height(20)
        nameOfCell.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        simpleImage.translatesAutoresizingMaskIntoConstraints = false
        simpleImage.trailing(-24)
        simpleImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        simpleImage.height(20)
        simpleImage.width(10)
    }
}

private func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    return label
}

private func makeSimpleImage() -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage.init(systemName: "chevron.right")
    return imageView
}

private func makeLine() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.Pallete.lightGray
    view.layer.cornerRadius = 0.2
    return view
}
