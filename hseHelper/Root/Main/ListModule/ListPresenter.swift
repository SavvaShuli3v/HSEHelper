//
//  ListPresenter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import Foundation

final class ListPresenter {
    weak var view: ListViewInput?
    weak var moduleOutput: ListModuleOutput?

    private let router: ListRouterInput
    private let interactor: ListInteractorInput

    init(router: ListRouterInput, interactor: ListInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ListPresenter: ListModuleInput {
    
}

extension ListPresenter: ListViewOutput {

}

extension ListPresenter: ListInteractorOutput {

}



