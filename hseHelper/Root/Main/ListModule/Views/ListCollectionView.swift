//
//  ListCollectionView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 28.12.2021.
//

import UIKit

protocol ListCollectionViewProtocol: AnyObject {
    func showThemeFromCollection()
}

final class ListCollectionView: UICollectionView {
    
    weak var answerDelegate: ListCollectionViewProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        backgroundColor = .clear
        register(ListCollectionViewCell.self)
        dataSource = self
        delegate = self
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesShouldCancel(in view: UIView) -> Bool {
        true
    }
}

extension ListCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ListCollectionViewCell = dequeueReusableCell(for: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ListCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.width - 64, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}

extension ListCollectionView: ListCollectionViewCellProtocol {
    func showThemeFromNews() {
        answerDelegate?.showThemeFromCollection()
    }
}
