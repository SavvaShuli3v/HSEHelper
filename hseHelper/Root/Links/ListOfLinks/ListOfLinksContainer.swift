//
//  ListOfLinksContainer.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.01.2022.
//

import UIKit

final class ListOfLinksContainer {
    func assembly() -> UIViewController {
        let router = ListOfLinksRouter()
        let vc = ListOfLinksViewController(output: router)
        router.viewController = vc
        return vc
    }
}
