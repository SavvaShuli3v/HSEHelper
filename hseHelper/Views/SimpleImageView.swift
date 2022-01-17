//
//  SimpleImageView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class SimpleImageView: UIView {
    private lazy var imageView = makeImageView()
    
    private var top: CGFloat
    private var bottom: CGFloat
    private var leading: CGFloat
    private var trailing: CGFloat
    
    init(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leading(leading)
        imageView.trailing(trailing)
        imageView.top(top)
        imageView.bottom(bottom)
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
    return imageView
}
