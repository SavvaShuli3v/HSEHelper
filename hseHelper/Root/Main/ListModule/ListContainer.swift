//
//  ListContainer.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListContainer {
    let input: ListModuleInput
    let viewController: UIViewController
    private(set) weak var router: ListRouterInput!

    class func assemble(with context: ListModuleContext) -> ListContainer {
        let router = ListRouter(presentAction: context.presentAction)
        let interactor = ListInteractor()
        let presenter = ListPresenter(router: router, interactor: interactor)
        let viewController = ListViewController(output: presenter)

        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput

        interactor.output = presenter

        router.viewController = viewController

        return ListContainer(view: viewController, input: presenter, router: router)
    }

    private init(view: UIViewController, input: ListModuleInput, router: ListRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

struct ListModuleContext {
    let presentAction: () -> Void
    weak var moduleOutput: ListModuleOutput?
}
