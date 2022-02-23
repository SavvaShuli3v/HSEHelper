//
//  ListOfLinksService.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 26.01.2022.
//

import UIKit

struct ListOfLinksModel {
    let nameOfLinks: String
    let links: String
    let image: UIImage?
    let textColor: UIColor
}

final class ListOfLinksService {
    static let data = [
        ListOfLinksModel(
            nameOfLinks: "LMS",
            links: "",
            image: UIImage.init(named: "hseAn"),
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "Smart LMS",
            links: "",
            image: .init(named: "smartLMS"),
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "Классрум",
            links: "",
            image: UIImage.init(named: "classroom2"),
            textColor: .white),
        ListOfLinksModel(
            nameOfLinks: "Outlook",
            links: "",
            image: nil,
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "Электронные ресурсы ВШЭ = библеотека",
            links: "",
            image: nil,
            textColor: .black)
    ]
}
