//
//  FavoritesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill]? = Utils.getFavorite(key: "usersFavorite")
    
    func setArrayFavoritesMovies(movie: MoviesFill) {
        self.arrayFavoritesMovies?.append(movie)
        guard let arrayFavoritesMovies = arrayFavoritesMovies else {return}
        for value in arrayFavoritesMovies {
            print ("ARRAY")
            print (value.title)
        }
    }
}
