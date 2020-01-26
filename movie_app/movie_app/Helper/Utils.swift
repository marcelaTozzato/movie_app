//
//  Utils.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class Utils {
    
    static func setFavorite <T: Codable> (value: [T]?, key: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey:key)
    }
    
    static func getFavorite <T: Codable> (key: String) -> [T]? {
        let favoriteMovieData = UserDefaults.standard.object(forKey: key) as? Data
        let favoriteMovie = try? PropertyListDecoder().decode([T].self, from: favoriteMovieData ?? Data())
        return favoriteMovie
    }
    
    static func isFavorite (value: Bool, key: String) -> Bool {
        
        return true
    }
}  

extension UserDefaults {

    func setTheme(value: Bool) {
        set(value, forKey: "isLightTheme")
        synchronize()
    }
    
    func getTheme() -> Bool {
        return bool(forKey: "isLightTheme")
    }
}
