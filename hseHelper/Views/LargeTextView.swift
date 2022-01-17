//
//  LargeTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class LargeTextView: UIView {
    private lazy var largeText = makeLargeLabel()
    
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
        addSubview(largeText)
        largeText.text = text
        
        largeText.translatesAutoresizingMaskIntoConstraints = false
        largeText.leading(leading)
        largeText.trailing(trailing)
        largeText.top(top)
        largeText.bottom(bottom)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.numberOfLines = 0
    return label
}
