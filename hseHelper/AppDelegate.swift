//
//  AppDelegate.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 09.12.2021.
//

import UIKit

let themeWindow = ThemeWindow()

final class ThemeWindow: UIWindow {
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if Theme.current == .system {
            Theme.system.setActive()
        }
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var coordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        themeWindow.makeKey()
        coordinator.startWithList()
        return true
    }
}

