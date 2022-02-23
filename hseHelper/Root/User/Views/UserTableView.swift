//
//  UserTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 20.02.2022.
//

import UIKit

protocol UserTableViewDelegate: AnyObject {
    func scrollViewDidScroll()
}

final class UserTableView: UITableView {
    weak var answerDelegate: UserTableViewDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .Pallete.white
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        dataSource = self
        delegate = self
        register(UserMailTableViewCell.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        answerDelegate?.scrollViewDidScroll()
    }
}

extension UserTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserMailTableViewCell = dequeueReusableCell(for: indexPath)
        cell.configure(text: "sashulyatev@miem.hse.ru")
        return cell
    }
    
    
}

extension UserTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
}

extension UserTableView: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
    }
}
