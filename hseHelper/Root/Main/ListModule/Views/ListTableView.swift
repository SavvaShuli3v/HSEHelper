//
//  ListTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

protocol ListTableViewDelegate: AnyObject {
    func tappedToCell(with indexPath: IndexPath)
}

final class ListTableView: UITableView {
    weak var answerDelegate: ListTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //func setData(with )
    
    private func setupTableView() {
        backgroundColor = .clear
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        
        dataSource = self
        delegate = self
        
        register(ListTableViewCell.self)
        register(LastThemeTableViewCell.self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let selectedIndexPath = indexPathForSelectedRow {
            deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}

extension ListTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: LastThemeTableViewCell = dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: ListTableViewCell = dequeueReusableCell(for: indexPath)
            return cell
        default:
            preconditionFailure()
        }
    }
}

extension ListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 150
        case 1:
            return 100
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        answerDelegate?.tappedToCell(with: indexPath)
    }
}


