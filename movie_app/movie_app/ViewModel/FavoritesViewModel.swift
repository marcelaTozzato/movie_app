//
//  FavoritesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill] = Utils.getFavorite(key: "usersFavorite") ?? [MoviesFill]()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setArrayFavoritesMovies() {
        NotificationCenter.default.addObserver(self, selector: #selector(appendArrayFavoritesMovies(notification:)), name: .savedFavorite, object: nil)
    }
    
    func getArrayFavoritesMovies() -> [MoviesFill]{
        return arrayFavoritesMovies
    }

    @objc func appendArrayFavoritesMovies(notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let currentMovie = dict["currentMovie"] as? MoviesFill {
                self.checkIfMovieAlreadyExistsInArray(movie: currentMovie)
            }
        }
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
        NotificationCenter.default.removeObserver(self)
    }
    
    func checkIfMovieAlreadyExistsInArray(movie: MoviesFill){
        if !arrayFavoritesMovies.contains(obj: movie) {
            self.arrayFavoritesMovies.append(movie)
        } else {
            arrayFavoritesMovies = self.arrayFavoritesMovies.filter {$0 != movie}
        }
    }
}
