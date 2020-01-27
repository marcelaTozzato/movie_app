//
//  UINavigationController + Extension.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func applyTheme() {
        
        navigationBar.barTintColor = Theme.current.barTint
        navigationBar.tintColor = Theme.current.textTint
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.textTint]
        navigationBar.titleTextAttributes = textAttributes
        
        navigationBar.isTranslucent = false
        navigationBar.barStyle = Theme.current.statusBar
    }
}
