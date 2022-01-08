//
//  CoordinatorService.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

final class CoordinatorService {
    private let VCID = [
        VCIDModel(id: "mosCard0", vc: MosCardViewController())
    ]
}

struct VCIDModel {
    var id: String
    var vc: UIViewController
}
