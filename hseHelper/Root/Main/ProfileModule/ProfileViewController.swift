//
//  ProfileViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.12.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var closeButton = makeCloseButton()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(closeButton)
        view.backgroundColor = UIColor.Pallete.white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        closeButton.frame = CGRect(
            origin: CGPoint(x: 100, y: 100),
            size: CGSize(width: 160, height: 60)
        )
    }
    
    @objc private func closeButton(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}

private func makeCloseButton() -> TableViewButton {
    let button = TableViewButton()
    button.layer.cornerRadius = 25
    button.backgroundColor = UIColor.Pallete.gray
    return button
}

private extension ProfileViewController {
    func setupNavigationBar() {
        //let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButton))
    }
}
