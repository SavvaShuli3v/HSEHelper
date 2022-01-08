//
//  LargeTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class LargeTextView: UIView {
    
    private var text: String
    private lazy var largeText = makeLargeLabel()
    
    init(text: String) {
        self.text = text
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(largeText)
        largeText.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        largeText.frame = CGRect(
            origin: CGPoint(x: 18, y: 18),
            size: CGSize(width: bounds.width - 36, height: bounds.height))
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.numberOfLines = 0
    return label
}
