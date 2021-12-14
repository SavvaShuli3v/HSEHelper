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
        let context = ListModuleContext(moduleOutput: nil)
        let container = ListContainer.assemble(with: context)
        
        navigationController.viewControllers = [container.viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showNextView() {
        let vc = ThemesViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showThemes(completion: @escaping () -> Void) {
        let vc = ThemesViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
