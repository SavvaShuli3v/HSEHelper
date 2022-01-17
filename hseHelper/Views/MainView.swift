//
//  MainView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.01.2022.
//

import UIKit

class MainView: UIView {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
