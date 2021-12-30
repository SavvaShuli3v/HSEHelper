//
//  ThemesContainer.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import UIKit

final class ThemesContainer {
    let input: ThemesModuleInput
    let viewController: UIViewController
    private(set) weak var router: ThemesRouterInput!
    
    class func assembly(with context: ThemesModuleContext) -> ThemesContainer {
        let router = ThemesRouter()
        let interactor = ThemesInteractor()
        let presenter = ThemesPresenter(router: router, interactor: interactor)
        let viewController = ThemesViewController(output: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.output = presenter
        
        router.viewController = viewController
        
        return ThemesContainer(view: viewController, input: presenter, router: router)
    }
    
    private init(view: UIViewController, input: ThemesModuleInput, router: ThemesRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct ThemesModuleContext {
    weak var moduleOutput: ThemesModuleOutput?
}


