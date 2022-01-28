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
            image: nil,
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "Smart LMS",
            links: "",
            image: nil,
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "LMS",
            links: "",
            image: nil,
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "LMS",
            links: "",
            image: nil,
            textColor: .black),
        ListOfLinksModel(
            nameOfLinks: "LMS",
            links: "",
            image: nil,
            textColor: .black)
    ]
}
