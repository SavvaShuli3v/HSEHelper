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
    func viewDidLoad() {
        interactor.isAppAlreadyLaunchedOnce()
        view?.setData(with: data)
    }
    
    func showThemeVC() {
        router.showThemesVC()
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


private let data = ListModel(
    lastTheme: "Последняя тема",
    themes: themes
)

private let themes = [
    ThemeModel(themeName: "Сдаем БЖД на 10", additionalInf: "Новое"),
    ThemeModel(themeName: "Оценки и накоп", additionalInf: "Самое важное"),
    ThemeModel(themeName: "Rарта Москвича", additionalInf: "В первую очередь"),
    ThemeModel(themeName: "Все о ЛМС"),
    ThemeModel(themeName: "О документах для студентов и что они дают"),
    ThemeModel(themeName: "Как поступить на военку"),
    ThemeModel(themeName: "Коворкинги"),
    ThemeModel(themeName: "Большая статья О Вышке"),
    ThemeModel(themeName: "Выбираем лучший майнор"),
    ThemeModel(themeName: "Лучший кофе - где он", additionalInf: "Новинка"),
    ThemeModel(themeName: "О документах для студентов и что они дают"),
    ThemeModel(themeName: "Рейтинг, или как не сойти с ума")
]
