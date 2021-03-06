//
//  ThemesTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 23.12.2021.
//

import UIKit

protocol ThemesTableViewDelegate: AnyObject {
    func showArticle()
    func tappedToCell(with indexPath: IndexPath)
}

final class ThemesTableView: UITableView {
    weak var answerDelegate: ThemesTableViewDelegate?
    
    private var themes: ThemesModel?
    
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
    
    func setData(with data: ThemesModel) {
        themes = data
        reloadData()
    }
    
    private func setupTableView() {
        backgroundColor = .clear
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        
        dataSource = self
        delegate = self
        
        register(ThemeImageTableViewCell.self)
        register(ThemesTableViewCell.self)
        register(TableViewTextCell.self)
        register(StartArticleTableViewCell.self)
        register(AboutArticleTableViewCell.self)
        register(ContainerTableViewCell<EmptyView>.self)
    }
}

extension ThemesTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        6
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
            return 1
        case 4:
            return themes?.article.count ?? 0
        case 5:
            return 1
        default:
            preconditionFailure()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: ThemeImageTableViewCell = dequeueReusableCell(for: indexPath)
            cell.setImage(image: themes?.mainImage)
            return cell
        case 1:
            let cell: AboutArticleTableViewCell = dequeueReusableCell(for: indexPath)
            if themes != nil {
                cell.setMainText(themes?.mainInfo ?? "")
                cell.settaskText(themes?.aboutInfo ?? "")
            }
            return cell
        case 2:
            let cell: StartArticleTableViewCell = dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        case 3:
            let cell: TableViewTextCell = dequeueReusableCell(for: indexPath)
            cell.setText(with: "Темы")
            return cell
        case 4:
            let cell: ThemesTableViewCell = dequeueReusableCell(for: indexPath)
            cell.setData(with: themes?.article[indexPath.row] ?? "", indexPath: indexPath)
            return cell
        case 5:
            let cell: ContainerTableViewCell<EmptyView> = dequeueReusableCell(for: indexPath)
            return cell
        default:
            preconditionFailure()
        }
    }
}

extension ThemesTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return bounds.width
        case 1:
            let main = themes?.mainInfo ?? ""
            let heightOfMain = main.height(
                constraintedWidth: bounds.width - 32,
                font: UIFont.systemFont(
                    ofSize: 28,
                    weight: .bold
                )
            )
            
            let about = themes?.aboutInfo ?? ""
            let heightOfAbout = about.height(
                constraintedWidth: bounds.width - 32,
                font: UIFont.systemFont(
                    ofSize: 18,
                    weight: .light
                )
            )
        
            let height = heightOfMain + heightOfAbout * 1.1 + 32
            return height
        case 2:
            return 90
        case 3:
            return 46
        case 4:
            return 62
        case 5:
            return 28
        default:
            preconditionFailure()
        }
    }
}

extension ThemesTableView: StartArticleTableViewCellProtocol {
    func showArtcile() {
        answerDelegate?.showArticle()
    }
}
