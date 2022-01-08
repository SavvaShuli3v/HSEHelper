//
//  IntroViewController.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import UIKit

final class IntroViewController: UIViewController {
    
    private lazy var helloLabel = makeBigLabel(with: "Привет!")
    private lazy var appNameLabel = makeBigLabel(with: "Это HSE помошник")
    private lazy var aboutAppLabel = makeLabel()
    private lazy var nextButton = makeNextButton()
    private lazy var mainImageView = UIImageView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Pallete.white
        setupNavBar()
        view.addSubview(helloLabel)
        view.addSubview(appNameLabel)
        view.addSubview(aboutAppLabel)
        view.addSubview(nextButton)
        view.addSubview(mainImageView)
        
        aboutAppLabel.numberOfLines = 0
        aboutAppLabel.text = "Приложение с курсами, советами и лайфхаками для студентов вышки начальных курсов. \n\nВы узнаете, как оформить социальную карту или выбрать себе майнор, а может лучшее место для фотосъемки внутри вышки?)"
        
        nextButton.setAction { [weak self] in
            let transition: CATransition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            transition.subtype = CATransitionSubtype.fromBottom
            self?.view.window!.layer.add(transition, forKey: nil)
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

private extension IntroViewController {
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
    }
    
    func setupViews() {
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutAppLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        helloLabel.bottom(0, to: appNameLabel.topAnchor)
        helloLabel.leading(16, to: view.leadingAnchor)
        helloLabel.trailing(-16, to: view.trailingAnchor)
        
        appNameLabel.bottom(-44, to: aboutAppLabel.topAnchor)
        appNameLabel.leading(16, to: view.leadingAnchor)
        appNameLabel.trailing(-16, to: view.trailingAnchor)
        
        aboutAppLabel.leading(16, to: view.leadingAnchor)
        aboutAppLabel.trailing(-16, to: view.trailingAnchor)
        aboutAppLabel.bottom(-44, to: nextButton.topAnchor)
        
        nextButton.bottom(-16, to: mainImageView.topAnchor)
        nextButton.leading(16, to: view.leadingAnchor)
        nextButton.trailing(-16, to: view.trailingAnchor)
        nextButton.height(44)
        
        mainImageView.backgroundColor = .lightGray
        mainImageView.leading()
        mainImageView.trailing()
        mainImageView.bottom()
        mainImageView.height(view.bounds.height / 3)
    }
}

private func makeBigLabel(with text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = UIColor.Pallete.black
    label.font = .systemFont(ofSize: 28, weight: .bold)
    return label
}

private func makeLabel() -> UILabel {
    let label = UILabel()
    label.textColor = UIColor.Pallete.lightGray
    label.font = .systemFont(ofSize: 18, weight: .light)
    return label
}

private func makeNextButton() -> IntroNextButton {
    let button = IntroNextButton()
    button.setTitle("Начать пользоваться", for: .normal)
    button.setTitleColor(UIColor.Pallete.black, for: .normal)
    button.layer.cornerRadius = 10
    button.backgroundColor = UIColor.Pallete.lightPurple
    return button
}
