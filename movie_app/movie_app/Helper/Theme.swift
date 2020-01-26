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
    var statusBar: UIStatusBarStyle { get }
    var cellBackground: UIColor { get }
    var font: String { get }
}

class LightTheme: ThemeProtocol {
    var background: UIColor = .white
    var barTint: UIColor = .customLigthYellow
    var textColor: UIColor = .black
    var textTint: UIColor = .black
    var statusBar: UIStatusBarStyle = .darkContent
    var cellBackground: UIColor = .customDarkBlue
    var font: String = "WillGrace"
}

class DarkTheme: ThemeProtocol {
    var background: UIColor = .customLigthBlue
    var barTint: UIColor = .customDarkBlue
    var textColor: UIColor = .white
    var textTint: UIColor = .white
    var statusBar: UIStatusBarStyle = .lightContent
    var cellBackground: UIColor = .customDarkYellow
    var font: String = "WillGrace"
}

class Theme {
    static var current: ThemeProtocol = LightTheme()
}
