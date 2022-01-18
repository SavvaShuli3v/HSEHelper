//
//  SimpleTextView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.01.2022.
//

import UIKit

final class SimpleTextView: UIView {
    private lazy var textLabel = makeLargeLabel()

    init() {
        super.init(frame: .zero)
        backgroundColor = .red
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.leading(16)
        textLabel.trailing(-16)
        textLabel.top()
        textLabel.bottom()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        textLabel.text = text
        textLabel.setLineSpacing(lineSpacing: 5)
    }
}

private func makeLargeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.black
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    label.numberOfLines = 0
    return label
}


