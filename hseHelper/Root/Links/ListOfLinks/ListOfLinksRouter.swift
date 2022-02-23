//
//  ListOfLinksRouter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 30.01.2022.
//

import UIKit

protocol ListOfLinksRouterInput {
    func showLink()
}

final class ListOfLinksRouter {
    weak var viewController: UIViewController?
}

extension ListOfLinksRouter: ListOfLinksRouterInput {
    func showLink() {
        print("Show from link")
    }
}
