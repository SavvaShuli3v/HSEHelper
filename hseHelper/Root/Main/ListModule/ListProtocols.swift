//
//  ListProtocols.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import Foundation

protocol ListModuleInput {
    
}

protocol ListModuleOutput: AnyObject {
    
}

protocol ListViewInput: AnyObject {
    func openIntroOfApp()
    func setData(with data: ListModel)
}

protocol ListViewOutput: AnyObject {
    func viewDidLoad()
    func showThemeVC(with index: Int)
    func showProfileVC()
}

protocol ListInteractorInput: AnyObject {
    func isAppAlreadyLaunchedOnce()
}

protocol ListInteractorOutput: AnyObject {
    func isAppAlreadyLaunchedOnceAnswer(with answer: Bool)
}

protocol ListRouterInput: AnyObject {
    func showThemesVC(with article: Article)
    func showProfileVC()
}
