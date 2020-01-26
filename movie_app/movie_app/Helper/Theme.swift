//
//  Theme.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 26/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

protocol ThemeProtocol: class {
    var ViewBackground: UIColor { get }
    var movieCellBackground: UIColor { get }
    var favoritesCellBackground: UIColor { get }
    var barTint: UIColor { get }
    var textColor: UIColor { get }
    var textTint: UIColor { get }
    var font: String { get }
}

class LightTheme: ThemeProtocol {
    var ViewBackground: UIColor = .white
    var barTint: UIColor = .customLigthYellow
    var favoritesCellBackground: UIColor = .green
    var textColor: UIColor = .black
    var textTint: UIColor = .black
    var movieCellBackground: UIColor = .customDarkBlue
    var font: String = "WillGrace"
}

class DarkTheme: ThemeProtocol {
    var ViewBackground: UIColor = .black
    var barTint: UIColor = .customLigthYellow //.customDarkBlue
    var favoritesCellBackground: UIColor = .red
    var textColor: UIColor = .white
    var textTint: UIColor = .black //.white
    var movieCellBackground: UIColor = .customDarkYellow
    var font: String = "WillGrace"
}

class Theme {
    static var current: ThemeProtocol = LightTheme()
}
