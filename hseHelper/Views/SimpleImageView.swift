//
//  SimpleImageView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class SimpleImageView: UIView {
    private lazy var imageView = makeImageView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leading()
        imageView.trailing()
        imageView.top()
        imageView.bottom()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(with image: UIImage) {
        imageView.image = image
    }
}

private func makeImageView() -> UIImageView {
    let imageView = UIImageView()
    imageView.backgroundColor = .gray
    return imageView
}
