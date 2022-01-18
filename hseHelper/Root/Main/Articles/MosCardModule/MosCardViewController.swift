//
//  MosCardViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 31.12.2021.
//

import UIKit
 
final class MosCardViewController: UIViewController {
    private lazy var tableView = MosCardTableView()
    
    override func loadView() {
        let view = UIView()
        view.addSubview(tableView)
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
}
