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
    
}

protocol ThemesViewOutput: AnyObject {
    func showArticle()
}

protocol ThemesInteractorInput: AnyObject {
    
}

protocol ThemesInteractorOutput: AnyObject {
    
}

protocol ThemesRouterInput: AnyObject {
    func showArticle()
}
