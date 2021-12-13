//
//  AppDelegate.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 09.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var coordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.startWithList()
        return true
    }
}

