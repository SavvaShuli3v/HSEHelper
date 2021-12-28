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
            presentAction: { [weak navigationController] in
                print($0)
                navigationController?.pushViewController($0, animated: true)
            },
            moduleOutput: nil
        )
        let container = ListContainer.assemble(with: context)
        
        navigationController.viewControllers = [container.viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showNewVC(vc viewController: UIViewController) {
        //let vc = viewController
    }
}
