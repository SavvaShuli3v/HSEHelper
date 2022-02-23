//
//  AppCoordinator.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 09.12.2021.
//

import UIKit

final class AppCoordinator {
    
    private let window = UIWindow(frame: UIScreen.main.bounds)
    private let tabBarController = UITabBarController()
    private let mainNavigationController = MainNavigationController()
    private let linksNavigationController = MainNavigationController()
    private let userNavigationController = MainNavigationController()
    
    func startWithList() {
        window.initTheme()
        
        let context = ListModuleContext(
            presentAction: { [weak self] article in
                self?.showThemesVC(with: article)
            },
            moduleOutput: nil
        )
        let container = ListContainer.assemble(with: context)
        mainNavigationController.viewControllers = [container.viewController]
        
        let linksContainer = ListOfLinksContainer()
        linksNavigationController.viewControllers = [linksContainer.assembly()]
        
        let userContainer = UserContainer()
        userNavigationController.viewControllers = [userContainer.vc]
        
        
        window.rootViewController = tabBarController
        tabBarController.setViewControllers(
            [installationVC(
                rootViewController: mainNavigationController,
                title: "Статьи",
                image: UIImage.init(systemName: "eye.circle") ?? UIImage()
            ),
             installationVC(
                rootViewController: linksNavigationController,
                title: "Ссылки",
                image: UIImage.init(systemName: "globe") ?? UIImage()
             ),
             installationVC(
                rootViewController: userNavigationController,
                title: "Профиль",
                image: UIImage.init(systemName: "person") ?? UIImage())
            ]
        , animated: true)
        window.makeKeyAndVisible()
    }
    
    func showThemesVC(with article: Article) {
        let context = ThemesModuleContext(moduleOutput: nil, article: article)
        let container = ThemesContainer.assembly(with: context)
        mainNavigationController.pushViewController(container.viewController, animated: true)
    }
}

private func installationVC(
    rootViewController: UIViewController,
    title: String,
    image: UIImage
) -> UIViewController {
    let rootVC = rootViewController
    rootVC.tabBarItem.title = title
    rootVC.tabBarItem.image = image
    return rootVC
}
