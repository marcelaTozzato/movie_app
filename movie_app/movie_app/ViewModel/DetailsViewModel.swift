//
//  DetailsViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    private var favoritesServices: FavoritesService
    private var currentMovieObject: MovieObject?
    private var arrayFavoritesMovies: [MovieObject] = Utils.getFavorite(key: "usersFavorite") ?? [MovieObject]()
    
    init (favoritesServices: FavoritesService = FavoritesService()) {
        self.favoritesServices = favoritesServices
    }
    
    func prepareForNavigation(navigationData: MovieDetailNavigationData){
        self.currentMovieObject = navigationData.movies?.results[navigationData.index]
    }
    
    func isFavoriteMovie() -> Bool {
        return arrayFavoritesMovies.contains(obj: currentMovieObject)
    }
    
    func getCurrentMovie() -> MoviesFill {
        guard let detailMovie = currentMovieObject else {return MoviesFill(title: "", releaseYear: "", overview: "", posterURL: nil)}
        return Fill.transformObjectInToFill(object: detailMovie)
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
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
    }
    
    func getArrayFavoritesMovies() -> [MovieObject] {
        return arrayFavoritesMovies
    }
}
