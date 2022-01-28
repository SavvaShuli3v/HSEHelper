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
    private let article: Article
    
    init(router: ThemesRouterInput, interactor: ThemesInteractorInput, article: Article) {
        self.article = article
        self.router = router
        self.interactor = interactor
    }
}

extension ThemesPresenter: ThemesViewOutput {
    func viewDidLoad() {
        view?.getArticle(with: article.themesModel)
    }
    
    func showArticle() {
        router.showArticle(from: article.vc)
    }
}

extension ThemesPresenter: ThemesInteractorOutput {
    
}

extension ThemesPresenter: ThemesModuleInput {

}
