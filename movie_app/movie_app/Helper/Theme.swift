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
    var statusBar: UIBarStyle { get }
    var statusBarStyle: UIStatusBarStyle { get }
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
    
    //STATUS BAR:
    var statusBar: UIBarStyle = .default
    var statusBarStyle: UIStatusBarStyle = .darkContent
}

class DarkTheme: ThemeProtocol {
    //BACKGROUND
    var ViewBackground: UIColor = .darkGray
    var favoritesCellBackground: UIColor = .darkGray
    var movieCellBackground: UIColor = .customDarkYellow
    
    //TAB BAR AND NAVIGATION CONTROLLER
    var barTint: UIColor = .customDarkBlue
    var textTint: UIColor = .white
    
    //TEXT:
    var textColor: UIColor = .white
    var font: String = "WillGrace"
    
    //STATUS BAR:
    var statusBar: UIBarStyle = .black
    var statusBarStyle: UIStatusBarStyle = .lightContent
}

class Theme {
    static var current: ThemeProtocol = LightTheme()
}
