//
//  ProfileTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

protocol ProfileTableViewDelegate: AnyObject {
    func changeTheme()
    func textUs()
    func aboutApp()
    func aboutDev()
}

final class ProfileTableView: UITableView {
    weak var answerDelegate: ProfileTableViewDelegate?
    private var themeText = "\(Theme.current)"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(SimpleProfileCell.self)
        register(ChangeThemeTableViewCell.self)
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData() {
        themeText = "\(Theme.current)"
        reloadRows(at: [IndexPath(item: 0, section: 0)], with: .fade)
    }
}

extension ProfileTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let themeCell: ChangeThemeTableViewCell = dequeueReusableCell(for: indexPath)
            themeCell.answerDelegate = self
            themeCell.setNameCell(with: "Оформление")
            themeCell.setTheme(text: themeText)
            return themeCell
        case 1:
            let cell: SimpleProfileCell = dequeueReusableCell(for: indexPath)
            cell.setIndex(indexPath: indexPath)
            cell.answerDelegate = self
            cell.setNameCell(with: "Написать нам")
            return cell
        case 2:
            let cell: SimpleProfileCell = dequeueReusableCell(for: indexPath)
            cell.setIndex(indexPath: indexPath)
            cell.answerDelegate = self
            cell.setNameCell(with: "О приложении")
            return cell
        case 3:
            let cell: SimpleProfileCell = dequeueReusableCell(for: indexPath)
            cell.setIndex(indexPath: indexPath)
            cell.answerDelegate = self
            cell.setNameCell(with: "О разработке")
            return cell
        default:
            preconditionFailure()
        }
    }
}

extension ProfileTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}

extension ProfileTableView: SimpleProfileCellProtocol {
    func didTapToButton(with indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            answerDelegate?.textUs()
        case 2:
            answerDelegate?.aboutApp()
        case 3:
            answerDelegate?.aboutDev()
        default:
            preconditionFailure()
        }
    }
}

extension ProfileTableView: ChangeThemeTableViewCellProtocol {
    func didTapToButton() {
        answerDelegate?.changeTheme()
    }
}
