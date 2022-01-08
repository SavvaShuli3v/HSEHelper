//
//  ThemePanelVC.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 08.01.2022.
//

import UIKit

extension Theme {
    
    var name: String {
        switch self {
        case .system: return "System*"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }
}


class ThemePanelVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(rootContainerView)
        view.backgroundColor = .clear
        rootContainerView.frame = CGRect(
            origin: CGPoint(x: 0, y: view.bounds.height - 200),
            size: CGSize(width: view.bounds.width, height: 200))
    }
    
    private lazy var themeSegmentedControl: UISegmentedControl = {
        let segmentedView = UISegmentedControl(items: Theme.allCases.map { $0.name })
        segmentedView.tintColor = UIColor.Pallete.black
        segmentedView.selectedSegmentIndex = Theme.current.rawValue
        segmentedView.addTarget(self, action: #selector(selectTheme), for: .valueChanged)
        return segmentedView
    }()
    
    lazy var rootContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.Pallete.background
        
        let label = UILabel()
        label.text = "Theme"
        label.textColor = UIColor.Pallete.black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        
        let systemThemelabel = UILabel()
        systemThemelabel.text = "* System theme - the app's appearance will change automatically when you enable or disable iOS dark mode."
        systemThemelabel.textColor = UIColor.Pallete.black.withAlphaComponent(0.6)
        systemThemelabel.font = .systemFont(ofSize: 13)
        systemThemelabel.numberOfLines = 0
        
        [label, themeSegmentedControl, systemThemelabel].forEach(view.addSubview)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.top(6)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        themeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        themeSegmentedControl.top(16, to: label.bottomAnchor)
        themeSegmentedControl.leading(24)
        themeSegmentedControl.trailing(-24)
        
        return view
    }()
    
    @objc func selectTheme() {
        guard let theme = Theme(rawValue: themeSegmentedControl.selectedSegmentIndex) else { return }
        
        theme.setActive()
    }
    
}

