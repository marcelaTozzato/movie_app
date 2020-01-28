//
//  FavoritesService.swift
//  movie_app
//
//  Created by Marcela Tozzato on 28/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesService {
    
    typealias arrayFavoritesMovies<T> = (_ favoritesMovies: [T]) -> Void
    
    func setArrayFavoritesMovies(favoritesMovies: [MovieObject]) {
        UserDefaults.standard.setFavorite(value: favoritesMovies)
    }
    
    func getArrayFavoritesMovies(completion: arrayFavoritesMovies<MovieObject>) {
        completion(UserDefaults.standard.getFavorite() ?? [MovieObject]())
    }
}
