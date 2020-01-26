//
//  SettingsViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 26/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()

    }
    
    @IBAction func themeChangeSwitch(_ sender: UISwitch) {
        Theme.current = sender.isOn ? LightTheme() : DarkTheme()
            
        UserDefaults.standard.setTheme(value: sender.isOn)

        applyTheme()
        
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.background
        themeLabel.textColor = Theme.current.textColor
        
    }
}
