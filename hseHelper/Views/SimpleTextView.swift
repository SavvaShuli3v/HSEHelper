//
//  SimpleTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.01.2022.
//

import UIKit

final class SimpleTextView: UIView {
    private lazy var textLabel = makeLargeLabel()
    
    private var text: String
    private var top: CGFloat
    private var bottom: CGFloat
    private var leading: CGFloat
    private var trailing: CGFloat
    
    init(text: String, top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        self.top = top
        self.bottom = bottom
        self.leading = leading
        self.trailing = trailing
        self.text = text
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubview(textLabel)
        textLabel.text = text
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leading(leading)
        textLabel.trailing(trailing)
        textLabel.top(top)
        textLabel.bottom(bottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = CGRect(
            origin: CGPoint(x: 16, y: 16),
            size: CGSize(width: bounds.width - 32, height: bounds.height - 32))
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 0
    return label
}


