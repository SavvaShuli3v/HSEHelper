//
//  TestArticleViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 30.12.2021.
//

import UIKit

final class TestArticleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let backItem = UIBarButtonItem(title: "назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }
    
    private func test() {
        //let button = UINavigationItem.setLeftBarButton(.init(title: "Назад"))
        if #available(iOS 13.0, *) {
            navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: .init(systemName: "text.justify"), style: .plain, target: self, action: nil)
        } else {
            // Fallback on earlier versions
        }
    }
}
