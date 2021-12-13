//
//  AppCoordinator.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 09.12.2021.
//

import UIKit

final class AppCoordinator {
    
    private let window = UIWindow(frame: UIScreen.main.bounds)
    
    func startWithList() {
        let context = ListModuleContext(moduleOutput: nil)
        let container = ListContainer.assemble(with: context)
        
        window.rootViewController = container.viewController
        window.makeKeyAndVisible()
    }
}
