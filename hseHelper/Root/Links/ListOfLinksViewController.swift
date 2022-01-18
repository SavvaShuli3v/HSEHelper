//
//  ListOfLinksViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.01.2022.
//

import UIKit

final class ListOfLinksViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
        setupNavBar()
        tableView.register(LinksTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Ссылки"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Pallete.black]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: LinksTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setMainInfo("ЛМС")
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        220
    }
}
