//
//  UserViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 18.01.2022.
//

import UIKit

final class UserViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
        setupNavBar()
    }
}

private extension UserViewController {
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Pallete.black]
    }
}
