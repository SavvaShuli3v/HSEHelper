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
        view?.setData(with: data)
    }
    
    func showVC() {
        router.showThemesVC()
    }
}

extension ListPresenter: ListInteractorOutput {

}


private let data = ListModel(
    lastTheme: "Последняя тема",
    themes: themes
)

private let themes = [
    ThemeModel(themeName: "Здесь будет ваша тема 1"),
    ThemeModel(themeName: "Здесь будет ваша тема 2"),
    ThemeModel(themeName: "Здесь будет ваша тема 3"),
    ThemeModel(themeName: "Здесь будет ваша тема 4"),
    ThemeModel(themeName: "Здесь будет ваша тема 5"),
    ThemeModel(themeName: "Здесь будет ваша тема 6"),
    ThemeModel(themeName: "Здесь будет ваша тема 7"),
    ThemeModel(themeName: "Здесь будет ваша тема 8"),
    ThemeModel(themeName: "Здесь будет ваша тема 9"),
    ThemeModel(themeName: "Здесь будет ваша тема 10"),
]
