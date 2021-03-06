//
//  ThemesRouter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import UIKit

final class ThemesRouter {
    weak var viewController: UIViewController?
}

extension ThemesRouter: ThemesRouterInput {
    func showArticle(from vc: UIViewController) {
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
