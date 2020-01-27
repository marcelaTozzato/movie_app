//
//  UINavigationBar + Extensions.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 26/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    static func applyTheme() {
        UINavigationBar.appearance().tintColor = Theme.current.textTint
        UINavigationBar.appearance().barTintColor = Theme.current.barTint
        
        //appearance é um valor default
        //melhor ser usado apenas no app delegate
    }
}
