//
//  ListInteractor.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import Foundation

final class ListInteractor {
    weak var output: ListInteractorOutput?
}

extension ListInteractor: ListInteractorInput {
    func isAppAlreadyLaunchedOnce() {
        let isAppAlreadyLaunchedOnce = UserSettings.isAppAlreadyLaunchedOnce()
        output?.isAppAlreadyLaunchedOnceAnswer(with: isAppAlreadyLaunchedOnce)
    }
}
