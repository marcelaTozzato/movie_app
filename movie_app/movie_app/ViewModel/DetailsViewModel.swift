//
//  DetailsViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill] = Utils.getFavorite(key: "usersFavorite") ?? [MoviesFill]()
    
    func checkIfMovieAlreadyExistsInArray(movie: MoviesFill) {
        if !arrayFavoritesMovies.contains(obj: movie) {
            self.arrayFavoritesMovies.append(movie)
        } else {
            arrayFavoritesMovies = self.arrayFavoritesMovies.filter {$0 != movie}
        }
    }
    
    func setFavorite(movie: MoviesFill) {
        self.checkIfMovieAlreadyExistsInArray(movie: movie)
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
    }
    
    func getArrayFavoritesMovies() -> [MoviesFill] {
        return arrayFavoritesMovies
    }
}
