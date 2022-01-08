//
//  Theme.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import Foundation

enum Theme: Int, CaseIterable {
    case system = 0
    case light
    case dark
}

extension Theme {
    
    @Persist(key: "app_theme", defaultValue: Theme.system.rawValue)
    private static var appTheme: Int
    
    // Сохранение темы в UserDefaults
    func save() {
        Theme.appTheme = self.rawValue
    }
    
    // Текущая тема приложения
    static var current: Theme {
        Theme(rawValue: appTheme) ?? .system
    }
}
