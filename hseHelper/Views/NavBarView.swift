//
//  NavBarView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import UIKit

protocol ListProfileViewProtocol: AnyObject {
    func tappedToProfileButton()
}

final class NavBarView: UIView {
    weak var delegate: ListProfileViewProtocol?
    
    private lazy var imageView = UIImageView()
    private lazy var mainButton = TableViewButton()
    
    init(image: UIImage?) {
        super.init(frame: .zero)
        imageView.image = image
        addSubview(imageView)
        addSubview(mainButton)
        mainButton.setAction { [weak self] in
            self?.delegate?.tappedToProfileButton()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainButton.frame = bounds
        imageView.frame = bounds
    }
}
