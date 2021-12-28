//
//  LastNewsTableViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

final class LastNewsTableViewCell: UITableViewCell {
    
    private lazy var collectionView = ListCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}
