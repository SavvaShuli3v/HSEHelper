//
//  MosCardTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 01.01.2022.
//

import UIKit

final class MosCardTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        dataSource = self
        delegate = self
        setCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCells() {
        register(UITableViewCell.self)
    }
}

extension MosCardTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(for: indexPath)
        return cell
    }
    
    
}

extension MosCardTableView: UITableViewDelegate {
    
}
