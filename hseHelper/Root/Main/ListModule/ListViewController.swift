//
//  ListViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 13.12.2021.
//

import UIKit

final class ListViewController: UIViewController {
    private let output: ListViewOutput
    
    private lazy var profileView = ListProfileView(frame: .zero)
    private lazy var tableView = ListTableView()

    init(output: ListViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let view = UIView()
        view.addSubview(tableView)
        self.view = view
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(
                width: view.bounds.width,
                height: view.bounds.height
            )
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewDidLoad()
        view.backgroundColor = AppColors.black
        tableView.answerDelegate = self
        profileView.delegate = self
        setupNavBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showImage(false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showImage(true)
    }
}

extension ListViewController: ListViewInput {
    func openIntroOfApp() {
        let introContainer = IntroContainer()
        let vc = introContainer.viewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    func setData(with data: ListModel) {
        tableView.setData(with: data)
    }
}

extension ListViewController: ListTableViewDelegate {
    func tappedToCell(with indexPath: IndexPath) {
        output.showThemeVC()
    }
    
    func scrollViewDidScroll() {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

extension ListViewController: ListProfileViewProtocol {
    func tappedToProfileButton() {
        output.showProfileVC()
    }
}


// MARK: - private extension ListViewController -- Setup Navigation bar

private extension ListViewController {
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "HSE помошник"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setupNavBarUI()
    }
    
    func setupNavBarUI() {
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(profileView)
        
        profileView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        profileView.clipsToBounds = true
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            profileView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            profileView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            profileView.widthAnchor.constraint(equalTo: profileView.heightAnchor)
            ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
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

        profileView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    func showImage(_ show: Bool) {
        switch show {
        case true:
            UIView.animate(withDuration: 0.2) {
                self.profileView.alpha = show ? 1.0 : 0.0
            }
        case false:
            self.profileView.alpha = show ? 1.0 : 0.0
        }
    }
}

private struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 12
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}
