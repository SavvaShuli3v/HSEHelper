//
//  AllLinksViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 27.01.2022.
//

import UIKit

final class AllLinksViewController: UIViewController {
    private lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor.Pallete.white
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }

    @objc private func closeVCAction(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}

private extension AllLinksViewController {
    func setupNavigationBar() {
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeVCAction))
        navigationItem.rightBarButtonItem = button
    }
}
