//
//  ListViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListViewController: UIViewController {
    private let output: ListViewOutput

    init(output: ListViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListViewController: ListViewInput {

}
