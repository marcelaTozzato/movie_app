//
//  Theme.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 26/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

protocol ThemeProtocol: class {
    var background: UIColor { get }
    var barTint: UIColor { get }
    var textColor: UIColor { get }
    var textTint: UIColor { get }
}

class LightTheme: ThemeProtocol {
    var background: UIColor = .white
    var barTint: UIColor = .customLigthYellow
    var textColor: UIColor = .black
    var textTint: UIColor = .black
}

class DarkTheme: ThemeProtocol {
    var background: UIColor = .black
    var barTint: UIColor = .customDarkBlue
    var textColor: UIColor = .white
    var textTint: UIColor = .white
}

class Theme {
    static var current: ThemeProtocol = LightTheme()
}
