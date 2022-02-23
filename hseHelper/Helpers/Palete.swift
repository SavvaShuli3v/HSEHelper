//
//  Palete.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

extension UIColor {
    struct Pallete {
        static let white = UIColor.color(light: AppColors.white, dark: AppColors.black)
        static let black = UIColor.color(light: .black, dark: .white)
        static let lightGray = UIColor.color(light: .gray, dark: .lightGray)
        static let green = UIColor.color(light: .blue, dark: .gray)
        static let lightPurple = UIColor.color(light: AppColors.lightPurple, dark: AppColors.lightPurple)
        static let background = UIColor.color(light: .white, dark: .hex("1b1b1d"))
        static let secondaryBackground = UIColor.color(light: AppColors.white, dark: AppColors.black)
        static let gray = UIColor.color(light: .lightGray, dark: .hex("8e8e92"))
    }
}

extension UIColor {
    static func rgba(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

private enum AppColors {
    static let black: UIColor = .rgba(24, 25, 27)
    static let white: UIColor = .rgba(255, 255, 255)
    static let lightGray: UIColor = .lightGray
    static let lightPurple: UIColor = .rgba(98, 98, 220)
    static let gray: UIColor = .rgba(44, 44, 44)
}
