//
//  ListViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListViewController: UIViewController {
    private let output: ListViewOutput
    
    private lazy var tableView = ListTableView()

    init(output: ListViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()
        view.addSubview(tableView)
        self.view = view
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(
                width: view.bounds.width,
                height: view.bounds.height
            )
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        view.backgroundColor = .white
        tableView.answerDelegate = self
    }
}

extension ListViewController: ListViewInput {
    func setData(with data: ListModel) {
        //print(data)
    }
}

extension ListViewController: ListTableViewDelegate {
    func tappedToCell(with indexPath: IndexPath) {
        output.showVC()
    }
}
