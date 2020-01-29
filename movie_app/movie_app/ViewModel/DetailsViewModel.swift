//
//  DetailsViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

protocol DetailsViewModelDelegate: class {
    func reloadData()
}

class DetailsViewModel {
    
    private var favoritesProtocol: FavoritesProtocol
    private var currentMovieObject: MovieObject?
    var arrayFavoritesMovies: [MovieObject] = []
    
    weak var delegate: DetailsViewModelDelegate?
    
    init (delegate: DetailsViewModelDelegate?, favoritesProtocol: FavoritesProtocol = FavoritesService()) {
        self.favoritesProtocol = favoritesProtocol
        self.delegate = delegate
    }
    
    func fetchArrayFavoritesMovies() {
        self.favoritesProtocol.getArrayFavoritesMovies { (response) in
            self.arrayFavoritesMovies = response
            self.delegate?.reloadData()
        }
    }
    
    func prepareForNavigation(navigationData: MovieDetailNavigationData){
        self.currentMovieObject = navigationData
    }
    
    func populateCell() -> MoviesFill {
        guard let detailMovie = currentMovieObject else {return MoviesFill(title: "", releaseYear: "", overview: "", posterURL: nil)}
        return detailMovie.fill()
    }
    
    func isFavoriteMovie() -> Bool {
        return arrayFavoritesMovies.contains(obj: currentMovieObject)
    }
    
    private func checkIfMovieAlreadyExistsInArray() {
        guard let currentMovieObject = currentMovieObject else {return}
        if !isFavoriteMovie() {
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
