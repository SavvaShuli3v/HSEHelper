//
//  ListModel.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import Foundation
import UIKit

struct ListModel {
    var themes: [ThemeModel]
    var futureThemes: [ThemeModel]
}

struct ThemeModel {
    var themeName: String
    var additionalInf: String?
    var image: UIImage?
}
