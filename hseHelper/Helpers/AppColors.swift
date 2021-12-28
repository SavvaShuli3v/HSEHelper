//
//  Colors.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.12.2021.
//

import UIKit

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

enum AppColors {
    static let black: UIColor = .rgba(24, 25, 27)
    static let white: UIColor = .rgba(255, 255, 255)
    static let lightGray: UIColor = .lightGray
    static let lightPurple: UIColor = .rgba(98, 98, 220)
}
