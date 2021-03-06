//
//  Theme + app.swift
//  hseHelper
//
//  Created by Савва Шулятьев on 07.01.2022.
//

import UIKit

extension Theme {
    
    @available(iOS 13.0, *)
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .system: return themeWindow.traitCollection.userInterfaceStyle
        }
    }
    
    func setActive() {
        // Сохраняем активную тему
        save()
        
        guard #available(iOS 13.0, *) else { return }
        
        // Устанавливаем активную тему для всех окон приложения
        UIApplication.shared.windows
            .filter { $0 != themeWindow } // не красим это окно чтобы узнавать системную тему
            .forEach { $0.overrideUserInterfaceStyle = userInterfaceStyle }
    }
}

