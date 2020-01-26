//
//  UITabBar + Extensions.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 26/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

extension UITabBar {
    static func applyTheme() {
        UITabBar.appearance().barTintColor = Theme.current.barTint
        UITabBar.appearance().tintColor = Theme.current.textTint
        UITabBar.appearance().backgroundColor = Theme.current.background
    }
}
