//
//  MosCardTableView.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 01.01.2022.
//

import UIKit

final class MosCardTableView: UITableView {
    private let model = MosCardModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .clear
        dataSource = self
        delegate = self
        separatorStyle = .none
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func registerCells() {
        register(ContainerTableViewCell<SimpleImageView>.self)
        register(ContainerTableViewCell<LargeTextView>.self)
        register(ContainerTableViewCell<SimpleTextView>.self)
        register(ContainerTableViewCell<HeadingView>.self)
    }
}

extension MosCardTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: ContainerTableViewCell<SimpleImageView> = dequeueReusableCell(for: indexPath)
            return cell
        case 1:
            let cell: ContainerTableViewCell<LargeTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(with: model.name)
            return cell
        case 2:
            let cell: ContainerTableViewCell<SimpleTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.about)
            return cell
        case 3:
            let cell: ContainerTableViewCell<HeadingView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.title1)
            return cell
        case 4:
            let cell: ContainerTableViewCell<SimpleTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.plus1)
            return cell
        case 5:
            let cell: ContainerTableViewCell<SimpleTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.plus2)
            return cell
        case 6:
            let cell: ContainerTableViewCell<SimpleTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.plus3)
            return cell
        case 7:
            let cell: ContainerTableViewCell<SimpleTextView> = dequeueReusableCell(for: indexPath)
            cell.view.setText(text: model.plus4)
            return cell
        default:
            preconditionFailure()
        }
    }
    
    
}

extension MosCardTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return bounds.width / 3
        case 1:
            let main = model.name
            let heightOfMain = main.height(
                constraintedWidth: bounds.width - 32,
                font: UIFont.systemFont(
                    ofSize: 32,
                    weight: .bold
                )
            )
            return heightOfMain
        case 2:
            let text = model.about
            let heightOfText = text.height(
                constraintedWidth: bounds.width - 32,
                font: UIFont.systemFont(
                    ofSize: 20,
                    weight: .light
                )
            )
            return heightOfText * 1.2
        case 3:
            return 30
        case 4:
            let text = model.plus1
            let height = text.height(constraintedWidth: bounds.width - 32, font: .systemFont(ofSize: 20, weight: .light))
            return height * 1.2
        case 5:
            let text = model.plus2
            let height = text.height(constraintedWidth: bounds.width - 32, font: .systemFont(ofSize: 20, weight: .light))
            return height * 1.2
        case 6:
            let text = model.plus3
            let height = text.height(constraintedWidth: bounds.width - 32, font: .systemFont(ofSize: 20, weight: .light))
            return height * 1.2
        case 7:
            let text = model.plus4
            let height = text.height(constraintedWidth: bounds.width - 32, font: .systemFont(ofSize: 20, weight: .light))
            return height * 1.2
        default:
            preconditionFailure()
        }
    }
}

private struct MosCardModel {
    let name = "Социальная карта - карта Москвича"
    let about = "Оформить социальную карту или карту москвича, как ее еще по-другому называют, может каждый студент очной формы обучения. Да, только очной, студенты, которые обучаются заочно, к сожалению, такой возможности не имеют."
    let title1 = "Что даёт карта?"
    let plus1 = "1. Льготный проезд на метро"
    let plus2 = "2. Льготный проезд на наземном общественном транспорте"
    let plus3 = "3. Запись к врачу (с помощью инфокиосков в поликлинике, к которой ты прикреплен)"
    let plus4 = "4. Возможность использовать карту - как банковскую, оплачивать покупки, получение стипендии"
}
