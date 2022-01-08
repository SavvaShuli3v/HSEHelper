//
//  ListRouter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListRouter {
    weak var viewController: UIViewController?
    private let presentAction: () -> Void
    
    init(presentAction: @escaping () -> Void) {
        self.presentAction = presentAction
    }
}

extension ListRouter: ListRouterInput {
    func showProfileVC() {
        viewController?.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    func showThemesVC() {
        presentAction()
    }
}
