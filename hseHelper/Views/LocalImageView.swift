//
//  LocalImageView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class LocalImageView: UIView {
    private lazy var imageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(
            origin: CGPoint(x: 16, y: 0),
            size: CGSize(width: bounds.width - 32, height: bounds.height))
    }
    
    func setImage(with image: UIImage) {
        imageView.image = image
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    return imageView
}

