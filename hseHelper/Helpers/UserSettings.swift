//
//  UserSettings.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 29.12.2021.
//

import Foundation

final class UserSettings {
    static func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: isAppAlreadyLaunchedOnceKey) {
            return true
        } else {
            defaults.set(true, forKey: isAppAlreadyLaunchedOnceKey)
            return false
        }
    }
}

private let isAppAlreadyLaunchedOnceKey: String = "isAppAlreadyLaunchedOnce"
