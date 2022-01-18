//
//  ListRouter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListRouter {
    weak var viewController: UIViewController?
    private let presentAction: (Article) -> Void
    
    init(presentAction: @escaping (Article) -> Void) {
        self.presentAction = presentAction
    }
}

extension ListRouter: ListRouterInput {
    func showThemesVC(with article: Article) {
        presentAction(article)
    }
    
    func showProfileVC() {
        let vc = ProfileViewController()
        let navController = MainNavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        viewController?.present(navController, animated: true, completion: nil)
    }
}
