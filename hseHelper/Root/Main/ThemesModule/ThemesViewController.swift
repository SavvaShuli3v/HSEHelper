//
//  ThemesViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

final class ThemesViewController: UIViewController {
    
    private lazy var tableView = ThemesTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.black
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}
