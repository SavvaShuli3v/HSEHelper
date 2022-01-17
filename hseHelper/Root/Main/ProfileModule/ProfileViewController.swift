//
//  ProfileViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 17.12.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var tabelView = ProfileTableView()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor.Pallete.white
        view.addSubview(tabelView)
        tabelView.answerDelegate = self
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabelView.frame = view.bounds
    }
    
    @objc private func closeVCAction(_: Any) {
        dismiss(animated: true, completion: nil)
    }
}

private extension ProfileViewController {
    func setupNavigationBar() {
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeVCAction))
        navigationItem.rightBarButtonItem = button
    }
}

extension ProfileViewController: ProfileTableViewDelegate {
    func textUs() {
        
    }
    
    func aboutApp() {
        
    }
    
    func changeTheme() {
        present(ThemePanelVC(), animated: true, completion: nil)
    }
}
