//
//  LargeTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class LargeTextView: UIView {
    private lazy var largeText = makeLargeLabel()
    private var text: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    func setText(with text: String) {
        largeText.text = text
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    label.numberOfLines = 0
    return label
}
