//
//  ListTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.01.2022.
//

import UIKit

final class ListTextView: MainView {
    private lazy var textLabel = makeLabel()
    
    override init(top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        super.init(top: top, bottom: bottom, leading: leading, trailing: trailing)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 0
    return label
}
