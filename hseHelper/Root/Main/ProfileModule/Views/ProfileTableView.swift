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
}

final class ProfileTableView: UITableView {
    weak var answerDelegate: ProfileTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        delegate = self
        dataSource = self
        register(SimpleProfileCell.self)
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SimpleProfileCell = dequeueReusableCell(for: indexPath)
        cell.setIndex(indexPath: indexPath)
        switch indexPath.row {
        case 0:
            cell.setNameCell(with: "Тема приложения")
        case 1:
            cell.setNameCell(with: "Написать нам")
        case 2:
            cell.setNameCell(with: "О приложении")
        default:
            preconditionFailure()
        }
        
        cell.answerDelegate = self
        return cell
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
        case 0:
            answerDelegate?.changeTheme()
        case 1:
            answerDelegate?.textUs()
        case 2:
            answerDelegate?.aboutApp()
        default:
            preconditionFailure()
        }
    }
}
