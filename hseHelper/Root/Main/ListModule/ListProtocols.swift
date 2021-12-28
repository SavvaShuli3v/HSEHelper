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
    func setData(with data: ListModel)
}

protocol ListViewOutput: AnyObject {
    func viewDidLoad()
    func showVC()
}

protocol ListInteractorInput: AnyObject {
    
}

protocol ListInteractorOutput: AnyObject {
    
}

protocol ListRouterInput: AnyObject {
    func showThemesVC()
}
