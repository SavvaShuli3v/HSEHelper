//
//  UserViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 18.01.2022.
//

import UIKit

final class UserViewController: UIViewController {
    
    private lazy var mainTableView = UserTableView()
    private lazy var profileView = NavBarView(image: .init(systemName: "gear") ?? .init(named: "person"))
    private lazy var zeroLabel = makeZeroLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
        setupNavBar()
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainTableView.frame = view.bounds
    }
    
    private func setupUI() {
        view.addSubview(mainTableView)
        mainTableView.answerDelegate = self
    }
}

extension UserViewController: UserTableViewDelegate {
    func scrollViewDidScroll() {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        moveAndResizeImage(for: height)
    }
}

// MARK: - private extension ListViewController -- Setup Navigation bar

private extension UserViewController {
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.Pallete.black]
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

private func makeZeroLabel() -> UILabel {
    let label = UILabel()
    return label
}
