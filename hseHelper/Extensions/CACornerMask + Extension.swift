//
//  CACornerMask + Extension.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

extension CACornerMask {
    static let top: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    static let bottom: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    static let left: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    static let right: CACornerMask = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    static let all: CACornerMask = [.top, .bottom]
    static let nothing: CACornerMask = []
}

extension UIView {
    func roundCorners(_ corners: CACornerMask = .all, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
        layer.masksToBounds = true
    }
}
