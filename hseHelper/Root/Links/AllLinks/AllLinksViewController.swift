//
//  AllLinksViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 27.01.2022.
//

import UIKit

final class AllLinksViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor.Pallete.white
        tableView.backgroundColor = .Pallete.white
        tableView.register(LinkTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LinkTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }

    @objc private func closeVCAction(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}

private extension AllLinksViewController {
    func setupNavigationBar() {
        navigationItem.title = "Все ссылки"
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeVCAction))
        navigationItem.rightBarButtonItem = button
    }
}
