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
    func showArticle() {
        //let backItem = UIBarButtonItem(title: "назад", style: .plain, target: nil, action: nil)
        //viewController?.navigationItem.backBarButtonItem = backItem
        viewController?.navigationController?.pushViewController(MosCardViewController(), animated: true)
    }
}
