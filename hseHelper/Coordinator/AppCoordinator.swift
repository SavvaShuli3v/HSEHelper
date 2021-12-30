//
//  AppCoordinator.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 09.12.2021.
//

import UIKit

final class AppCoordinator {
    
    private let window = UIWindow(frame: UIScreen.main.bounds)
    private let navigationController = UINavigationController()
    
    func startWithList() {
        let context = ListModuleContext(
            presentAction: { [weak self] in
                self?.showThemesVC()
            },
            moduleOutput: nil
        )
        let container = ListContainer.assemble(with: context)

        navigationController.viewControllers = [container.viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showThemesVC() {
        let context = ThemesModuleContext(moduleOutput: nil)
        let container = ThemesContainer.assembly(with: context)
        navigationController.pushViewController(container.viewController, animated: true)
    }
}
