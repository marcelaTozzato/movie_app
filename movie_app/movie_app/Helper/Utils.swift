//
//  Utils.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class Utils {
    
    static func setFavorite (value: MoviesFill?, key: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey:key)
    }
    
    static func getFavorite (key: String) -> MoviesFill? {
        let favoriteMovieData = UserDefaults.standard.object(forKey: key) as? Data
        let favoriteMovie = try? PropertyListDecoder().decode(MoviesFill.self, from: favoriteMovieData ?? Data())
        return favoriteMovie
    }
}
