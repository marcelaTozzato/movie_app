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
    //BACKGROUND
    var ViewBackground: UIColor = .white
    var favoritesCellBackground: UIColor = .white
    var movieCellBackground: UIColor = .customDarkBlue
    
    //TAB BAR AND NAVIGATION CONTROLLER
    var barTint: UIColor = .customLigthYellow
    var textTint: UIColor = .black
    
    //TEXT:
    var textColor: UIColor = .black
    var font: String = "WillGrace"
}

class DarkTheme: ThemeProtocol {
    //BACKGROUND
    var ViewBackground: UIColor = .darkGray
    var favoritesCellBackground: UIColor = .darkGray
    var movieCellBackground: UIColor = .customDarkYellow
    
    //TAB BAR AND NAVIGATION CONTROLLER
    var barTint: UIColor = .customLigthYellow //.customDarkBlue
    var textTint: UIColor = .black //.white
    
    //TEXT:
    var textColor: UIColor = .white
    var font: String = "WillGrace"
}

class Theme {
    static var current: ThemeProtocol = LightTheme()
}
