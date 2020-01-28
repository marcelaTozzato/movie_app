//
//  DetailsViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    private var favoritesProtocol: FavoritesProtocol
    private var currentMovieObject: MovieObject?
    private var arrayFavoritesMovies: [MovieObject] = []
    
    init (favoritesProtocol: FavoritesProtocol = FavoritesService()) {
        self.favoritesProtocol = favoritesProtocol
    }
    
    func fetchArrayFavoritesMovies() {
        self.favoritesProtocol.getArrayFavoritesMovies { (response) in
            self.arrayFavoritesMovies = response
        }
    }
    
    func prepareForNavigation(navigationData: MovieDetailNavigationData){
        self.currentMovieObject = navigationData.movies?.results[navigationData.index]
    }
    
    func populateCell() -> MoviesFill {
        guard let detailMovie = currentMovieObject else {return MoviesFill(title: "", releaseYear: "", overview: "", posterURL: nil)}
        return detailMovie.fill()
    }
    
    func isFavoriteMovie() -> Bool {
        return arrayFavoritesMovies.contains(obj: currentMovieObject)
    }
    
    func checkIfMovieAlreadyExistsInArray() {
        guard let currentMovieObject = currentMovieObject else {return}
        if !arrayFavoritesMovies.contains(obj: currentMovieObject) {
            self.arrayFavoritesMovies.append(currentMovieObject)
        } else {
            arrayFavoritesMovies = self.arrayFavoritesMovies.filter {$0 != currentMovieObject}
        }
    }
    
    func setFavorite() {
        self.checkIfMovieAlreadyExistsInArray()
        self.favoritesProtocol.setArrayFavoritesMovies(favoritesMovies: self.arrayFavoritesMovies)
    }
}
