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
    private let dataService = MOCDataService()

    init(router: ListRouterInput, interactor: ListInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension ListPresenter: ListModuleInput {
    
}

extension ListPresenter: ListViewOutput {
    func viewDidLoad() {
        interactor.isAppAlreadyLaunchedOnce()
        var themes = [ThemeModel]()
        for article in dataService.articles {
            themes.append(article.themeModel)
        }
        view?.setData(with: ListModel(themes: themes, futureThemes: futureThemes))
    }
    
    func showThemeVC(with index: Int) {
        router.showThemesVC(with: dataService.articles[index])
    }
    
    func showProfileVC() {
        router.showProfileVC()
    }
}

extension ListPresenter: ListInteractorOutput {
    func isAppAlreadyLaunchedOnceAnswer(with answer: Bool) {
        if !answer {
            view?.openIntroOfApp()
        }
    }
}

private let futureThemes = [
    ThemeModel(themeName: "Все о ЛМС", additionalInf: "Скоро" ),
    ThemeModel(themeName: "О документах для студентов и что они дают"),
    ThemeModel(themeName: "Как поступить на военку"),
    ThemeModel(themeName: "Коворкинги"),
    ThemeModel(themeName: "Большая статья О Вышке"),
    ThemeModel(themeName: "Выбираем лучший майнор"),
    ThemeModel(themeName: "Лучший кофе - где он"),
    ThemeModel(themeName: "О документах для студентов и что они дают"),
    ThemeModel(themeName: "Рейтинг, или как не сойти с ума")
]
