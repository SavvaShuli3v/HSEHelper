//
//  HeadingView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class HeadingView: UIView {
    private lazy var largeText = makeLargeLabel()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(largeText)
        largeText.translatesAutoresizingMaskIntoConstraints = false
        largeText.leading(16)
        largeText.trailing(-16)
        largeText.top()
        largeText.bottom()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        largeText.text = text
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.numberOfLines = 0
    return label
}

