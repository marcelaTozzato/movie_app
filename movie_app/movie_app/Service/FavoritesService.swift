//
//  FavoritesService.swift
//  movie_app
//
//  Created by Marcela Tozzato on 28/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesService: FavoritesProtocol {
    
    func getArrayFavoritesMovies(completion: @escaping arrayFavoritesMovies<MovieObject>) {
        completion(UserDefaults.standard.getFavorite() ?? [MovieObject]())
    }
    
    func setArrayFavoritesMovies(favoritesMovies: [MovieObject]) {
        UserDefaults.standard.setFavorite(value: favoritesMovies)
    }
}

