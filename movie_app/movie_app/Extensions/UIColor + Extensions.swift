//
//  UIColor + Extensions.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 07/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static let customLigthYellow = UIColor().colorFromHex("#F7CE5B")
    static let customDarkYellow = UIColor().colorFromHex("#D9971E")
    static let customDarkBlue = UIColor().colorFromHex("#2D3047")
    static let customLigthBlue = UIColor().colorFromHex("#404463")
    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
    
    
}
