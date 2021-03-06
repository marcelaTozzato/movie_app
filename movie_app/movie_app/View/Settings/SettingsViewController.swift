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
    @IBOutlet weak var themeChageSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        themeChageSwitch.isOn = UserDefaults.standard.getTheme()
    }
    
    @IBAction func themeChangeSwitch(_ sender: UISwitch) {
        
        Theme.current = sender.isOn ? LightTheme() : DarkTheme()
            
        UserDefaults.standard.setTheme(value: sender.isOn)

        applyTheme()
        
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Theme.current.statusBarStyle
    }
    
    fileprivate func applyTheme() {
        view.backgroundColor = Theme.current.ViewBackground
        themeLabel.textColor = Theme.current.textColor
        
        tabBarController?.applyTheme()
    }
}
