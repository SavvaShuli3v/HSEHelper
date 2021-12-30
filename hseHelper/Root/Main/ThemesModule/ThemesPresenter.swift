//
//  ThemesPresenter.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import Foundation

final class ThemesPresenter {
    weak var view: ThemesViewInput?
    weak var moduleOutput: ThemesModuleOutput?
    
    private let router: ThemesRouterInput
    private let interactor: ThemesInteractorInput
    
    init(router: ThemesRouterInput, interactor: ThemesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ThemesPresenter: ThemesViewOutput {
    
}

extension ThemesPresenter: ThemesInteractorOutput {
    
}

extension ThemesPresenter: ThemesModuleInput {
    
}
