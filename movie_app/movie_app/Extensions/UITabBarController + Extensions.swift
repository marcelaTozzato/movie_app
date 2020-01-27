//
//  UITabBarController + Extensions.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    func applyTheme() {
        
        tabBar.barTintColor = Theme.current.barTint
        tabBar.tintColor = Theme.current.textTint
        
        tabBar.isTranslucent = false
        
        setNeedsStatusBarAppearanceUpdate()
        
        }

}
