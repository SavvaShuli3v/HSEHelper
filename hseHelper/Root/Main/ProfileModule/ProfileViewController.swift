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
    
    func updateTableView() {
        tabelView.updateData()
    }
}

extension ProfileViewController: ProfileTableViewDelegate {
    func aboutDev() {
        
    }
    
    func textUs() {
        
    }
    
    func aboutApp() {
        
    }
    
    func changeTheme() {
        showSimpleActionSheet()
    }
}

private extension ProfileViewController {
    func showSimpleActionSheet() {
        let alert = UIAlertController(title: "Выбор темы приложения", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Светлая тема", style: .default, handler: { (_) in
            let theme = Theme.light
            theme.setActive()
            self.updateTableView()
        }))

        alert.addAction(UIAlertAction(title: "Темная тема", style: .default, handler: { (_) in
            let theme = Theme.dark
            theme.setActive()
            self.updateTableView()
        }))

        alert.addAction(UIAlertAction(title: "Как в системе", style: .default, handler: { (_) in
            let theme = Theme.system
            theme.setActive()
            self.updateTableView()
        }))

        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler: { (_) in
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
