//
//  ThemesViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 14.12.2021.
//

import UIKit

final class ThemesViewController: UIViewController {
    private let output: ThemesViewOutput
    
    private lazy var tableView = ThemesTableView()
    
    init(output: ThemesViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.black
        navigationItem.largeTitleDisplayMode = .never
        view.addSubview(tableView)
        tableView.answerDelegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ThemesViewController: ThemesViewInput {
    
}

extension ThemesViewController: ThemesTableViewDelegate {
    func showArticle() {
        let backItem = UIBarButtonItem(title: "назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(TestArticleViewController(), animated: true)
    }
    
    func tappedToCell(with indexPath: IndexPath) {
        
    }
}
