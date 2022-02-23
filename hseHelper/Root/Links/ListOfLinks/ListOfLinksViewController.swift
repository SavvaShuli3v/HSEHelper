//
//  ListOfLinksViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.01.2022.
//

import UIKit

final class ListOfLinksViewController: UITableViewController {
    private let output: ListOfLinksRouterInput!
    
    private lazy var servicesView = NavBarView(image: .init(systemName: "list.bullet") ?? .init(named: "person"))
    private let data = ListOfLinksService.data

    init(output: ListOfLinksRouterInput) {
        self.output = output
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
        setupNavBar()
        tableView.register(LinksTableViewCell.self)
        tableView.register(AllLinksTableViewCell.self)
        tableView.separatorStyle = .none
        servicesView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImage(true)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Ссылки"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Pallete.black]
        setupNavBarUI()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0..<5:
            let cell: LinksTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setLinksObject(data[indexPath.row])
            cell.configure(.systemBlue)
            return cell
        case 5:
            let cell: AllLinksTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        default:
            preconditionFailure()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0..<5:
            return view.bounds.width / 1.5
        case 5:
            return 84
        default:
            preconditionFailure()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.showLink()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

extension ListOfLinksViewController: AllLinksTableViewCellAnswer {
    func tappedToButton() {
        let navVC = UINavigationController(rootViewController: AllLinksViewController())
        present(navVC, animated: true, completion: nil)
    }
}

extension ListOfLinksViewController: ListProfileViewProtocol {
    func tappedToProfileButton() {
        let navVC = UINavigationController(rootViewController: AllLinksViewController())
        present(navVC, animated: true, completion: nil)
    }
}

private extension ListOfLinksViewController {
    func setupNavBarUI() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(servicesView)
        servicesView.clipsToBounds = true
        servicesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            servicesView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            servicesView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            servicesView.heightAnchor.constraint(equalToConstant: 30),
            servicesView.widthAnchor.constraint(equalTo: servicesView.heightAnchor)
            ])
    }
    
    func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        servicesView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    func showImage(_ show: Bool) {
        switch show {
        case true:
            UIView.animate(withDuration: 0.2) {
                self.servicesView.alpha = show ? 1.0 : 0.0
            }
        case false:
            self.servicesView.alpha = show ? 1.0 : 0.0
        }
    }
}

private struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 32
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 24
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 10
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 26
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}
