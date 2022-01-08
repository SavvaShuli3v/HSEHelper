//
//  UIWindow + theme.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import UIKit

extension UIWindow {

    func initTheme() {
        guard #available(iOS 13.0, *) else { return }
        
        overrideUserInterfaceStyle = Theme.current.userInterfaceStyle
    }
}
