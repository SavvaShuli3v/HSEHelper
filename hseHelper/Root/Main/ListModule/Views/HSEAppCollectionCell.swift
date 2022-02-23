//
//  HSEAppCollectionCell.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 06.02.2022.
//

import UIKit

protocol HSEAppCollectionCellProtocol: AnyObject {
    func showThemeFromNews()
}

final class HSEAppCollectionCell: UICollectionViewCell {
    weak var delegate: HSEAppCollectionCellProtocol?
    private var content: UIView?
    
    private lazy var mainView = makeContentView()
    private lazy var mainLabel = makeMainLabel()
    private lazy var mainButton = makeMainButton()
    private lazy var clearButton = UIButton()
    private lazy var contentImageView = UIImageView()
    private lazy var rexLabel = UILabel()
    private lazy var zachLabel = UILabel()
    private lazy var reitLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(mainView)
        mainView.layer.cornerRadius = 5
        addSubview(mainButton)
        addSubview(mainLabel)
        addSubview(clearButton)
        setConstraints()
        
        mainButton.setAction { [weak self] in
            self?.delegate?.showThemeFromNews()
        }
        
        clearButton.addTarget(self, action: #selector(touchEnded), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func touchEnded() {
        delegate?.showThemeFromNews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainView.frame = CGRect(
            origin: CGPoint(x: 16, y: 8),
            size: CGSize(width: 300, height: 150)
        )
    }
    
    func setObject(view: UIView) {
        
    }
    
    private func setConstraints() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.leading(16)
        mainLabel.width(300)
        mainLabel.top(10, to: mainView.bottomAnchor)
        
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.top(10, to: mainLabel.bottomAnchor)
        mainButton.leading(16)
        mainButton.height(30)
        mainButton.width(100)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.top(8)
        clearButton.leading(16)
        clearButton.width(300)
        clearButton.bottom(to: mainLabel.bottomAnchor)
        
        mainView.addSubview(contentImageView)
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.trailing(-28, to: mainView.trailingAnchor)
        contentImageView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        contentImageView.height(80)
        contentImageView.width(80)
        contentImageView.backgroundColor = .gray
        contentImageView.image = .init(named: "hseappx")
        contentImageView.layer.cornerRadius = 20
        contentImageView.clipsToBounds = true
        contentImageView.contentMode = .scaleAspectFit
        setupLabels()
    }
    
    private func setupLabels() {
        addSubview(rexLabel)
        rexLabel.translatesAutoresizingMaskIntoConstraints = false
        rexLabel.top(20, to: mainView.topAnchor)
        rexLabel.leading(6, to: mainView.leadingAnchor)
        rexLabel.text = "Расписание"
        rexLabel.textColor = .Pallete.black
        rexLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        
        addSubview(zachLabel)
        zachLabel.translatesAutoresizingMaskIntoConstraints = false
        zachLabel.top(50, to: mainView.topAnchor)
        zachLabel.leading(6, to: mainView.leadingAnchor)
        zachLabel.text = "Зачетка"
        zachLabel.textColor = .Pallete.black
        zachLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        
        addSubview(reitLabel)
        reitLabel.translatesAutoresizingMaskIntoConstraints = false
        reitLabel.top(80, to: mainView.topAnchor)
        reitLabel.leading(6, to: mainView.leadingAnchor)
        reitLabel.text = "Рейтинги"
        reitLabel.textColor = .Pallete.black
        reitLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        
    }
}

private func makeContentView() -> UIView {
    let view = UIView()
    view.backgroundColor = UIColor.Pallete.lightPurple
    return view
}

private func makeMainLabel() -> UILabel {
    let label = UILabel()
    label.backgroundColor = .clear
    label.font = UIFont.systemFont(ofSize: 18, weight: .light)
    label.numberOfLines = 2
    label.text = "Также скачайте HSE App X"
    label.textColor = UIColor.Pallete.black
    return label
}

private func makeMainButton() -> TableViewButton {
    let button = TableViewButton()
    button.setTitle("Скачать", for: .normal)
    button.setTitleColor(UIColor.Pallete.lightGray, for: .normal)
    button.layer.cornerRadius = 15
    button.layer.borderWidth = 0.5
    button.layer.borderColor = UIColor.Pallete.lightGray.cgColor
    return button
}

private func makeClearButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .clear
    return button
}
