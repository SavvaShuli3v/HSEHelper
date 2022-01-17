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
    
    private var key: String?
    
    init(router: ThemesRouterInput, interactor: ThemesInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ThemesPresenter: ThemesViewOutput {
    func showArticle() {
        router.showArticle()
    }
}

extension ThemesPresenter: ThemesInteractorOutput {
    
}

extension ThemesPresenter: ThemesModuleInput {
    var array: [Int] {
        get {
            print("get")
            return []
        }
        set {
            
        }
    }
    
    func setKey(with id: String) {
        key = id
    }
}
