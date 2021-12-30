//
//  LastNewsTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

protocol LastNewsTableViewCellProtocol: AnyObject {
    func showThemeFromLastNews()
}

final class LastNewsTableViewCell: UITableViewCell {
    
    weak var delegate: LastNewsTableViewCellProtocol?
    private lazy var collectionView = ListCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.addSubview(collectionView)
        collectionView.answerDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}

extension LastNewsTableViewCell: ListCollectionViewProtocol {
    func showThemeFromCollection() {
        delegate?.showThemeFromLastNews()
    }
}
