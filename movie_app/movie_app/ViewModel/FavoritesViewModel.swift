//
//  FavoritesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill] {
        return Utils.getFavorite(key: "usersFavorite") ?? [MoviesFill]()
    }
    
    func getArrayFavoritesMovies() -> [MoviesFill]{
        return arrayFavoritesMovies
    }
}
