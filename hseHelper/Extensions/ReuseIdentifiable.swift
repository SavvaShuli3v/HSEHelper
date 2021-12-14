//
//  ReuseIdentifiable.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

public protocol ReuseIdentifiable {
    static var reuseID: String { get }
}

public extension ReuseIdentifiable {
    static var reuseID: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UITableViewHeaderFooterView: ReuseIdentifiable {}
extension UICollectionReusableView: ReuseIdentifiable {}

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.reuseID, for: indexPath) as! T
        return cell
    }
    
    func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseID)
    }
}

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as! T
        return cell
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseID)
    }
}
