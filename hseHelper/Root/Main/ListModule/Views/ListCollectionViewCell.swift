//
//  ListCollectionViewCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 28.12.2021.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewCell {
    
    private lazy var mainImageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColors.black
        addSubview(mainImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImageView.frame = CGRect(
            origin: CGPoint(x: 16, y: 8),
            size: CGSize(width: bounds.width - 32, height: bounds.height - 64)
        )
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = AppColors.lightGray
    return imageView
}
