//
//  ThemesProtocols.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import Foundation

protocol ThemesModuleInput {

}

protocol ThemesModuleOutput: AnyObject {
    
}

protocol ThemesViewInput: AnyObject {
    func getArticle(with articleContext: ThemesModel)
}

protocol ThemesViewOutput: AnyObject {
    func showArticle()
    func viewDidLoad()
}

protocol ThemesInteractorInput: AnyObject {
    
}

protocol ThemesInteractorOutput: AnyObject {
    
}

protocol ThemesRouterInput: AnyObject {
    func showArticle()
}
