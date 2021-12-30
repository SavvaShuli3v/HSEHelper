//
//  ListProfileImageView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import UIKit

protocol ListProfileViewProtocol: AnyObject {
    func tappedToProfileButton()
}

final class ListProfileView: UIView {
    weak var delegate: ListProfileViewProtocol?
    
    private lazy var imageView = UIImageView()
    private lazy var mainButton = TableViewButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(mainButton)
        mainButton.setAction { [weak self] in
            self?.delegate?.tappedToProfileButton()
        }
        
        if #available(iOS 13.0, *) {
            imageView.image = .init(systemName: "person.crop.circle")
        } else {
            imageView.image = UIImage.init(named: "person")
            imageView.backgroundColor = .blue
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
