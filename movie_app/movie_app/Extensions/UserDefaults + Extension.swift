//
//  Utils.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation 

extension UserDefaults {
    
    func setFavorite <T: Codable> (value: [T]?) {
        set(try? PropertyListEncoder().encode(value), forKey: "usersFavorite")
    }

    func getFavorite <T: Codable> () -> [T]? {
        let favoriteMovieData = object(forKey: "usersFavorite") as? Data
        let favoriteMovie = try? PropertyListDecoder().decode([T].self, from: favoriteMovieData ?? Data())
        return favoriteMovie
    }

    func setTheme(value: Bool) {
        set(value, forKey: "isLightTheme")
        synchronize()
    }
    
    func getTheme() -> Bool {
        return bool(forKey: "isLightTheme")
    }
}
