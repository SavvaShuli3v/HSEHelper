//
//  ListRouter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListRouter {
    weak var viewController: UIViewController?
    private let presentAction: (UIViewController) -> Void
    
    init(presentAction: @escaping (UIViewController) -> Void) {
        self.presentAction = presentAction
    }
}

extension ListRouter: ListRouterInput {
    func showThemesVC() {
        //presentAction(ThemesViewController())
        viewController?.navigationController?.pushViewController(ThemesViewController(), animated: true)
        //viewController?.present(ThemesViewController(), animated: true, completion: nil)
    }
}
