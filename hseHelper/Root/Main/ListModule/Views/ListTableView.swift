//
//  ListTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

protocol ListTableViewDelegate: AnyObject {
    func tappedToCell(with indexPath: IndexPath)
    func scrollViewDidScroll()
}

final class ListTableView: UITableView {
    weak var answerDelegate: ListTableViewDelegate?
    
    private var themes = [ThemeModel]()
    private var futureThemes = [ThemeModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        answerDelegate?.scrollViewDidScroll()
    }
    
    func setThemes(with data: ListModel) {
        themes = data.themes
        futureThemes = data.futureThemes
    }
    
    private func setupTableView() {
        backgroundColor = .clear
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        
        dataSource = self
        delegate = self
        
        register(ListTableViewCell.self)
        register(TableViewTextCell.self)
        register(LastNewsTableViewCell.self)
        register(FutureTableViewCell.self)
    }
}

extension ListTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return themes.count
        case 4:
            return futureThemes.count
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: TableViewTextCell = dequeueReusableCell(for: indexPath)
            cell.setText(with: "Коротко о главном")
            return cell
        case 1:
            let cell: LastNewsTableViewCell = dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case 2:
            let cell: TableViewTextCell = dequeueReusableCell(for: indexPath)
            cell.setText(with: "Самое важное")
            return cell
        case 3:
            let cell: ListTableViewCell = dequeueReusableCell(for: indexPath)
            cell.delegate = self
            cell.setData(with: themes[indexPath.row])
            return cell
        case 4:
            let cell: FutureTableViewCell = dequeueReusableCell(for: indexPath)
            cell.setData(with: futureThemes[indexPath.row])
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
            return 60
        case 1:
            return 250
        case 2:
            return 60
        case 3:
            return 74
        case 4:
            return 74
        default:
            preconditionFailure()
        }
    }
}

extension ListTableView: LastNewsTableViewCellProtocol {
    func showThemeFromLastNews() {
        answerDelegate?.tappedToCell(with: IndexPath(item: 10, section: 10))
    }
}

extension ListTableView: ListTableViewCellProtocol {
    func cellTapped() {
        answerDelegate?.tappedToCell(with: IndexPath(item: 10, section: 10))
    }
}
