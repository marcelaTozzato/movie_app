//
//  FavoritesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill]?
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }

    func setArrayFavoritesMovies() {
        arrayFavoritesMovies = Utils.getFavorite(key: "usersFavorite")
        NotificationCenter.default.addObserver(self, selector: #selector(appendArrayFavoritesMovies(notification:)), name: .savedFavorite, object: nil)
    }

    @objc func appendArrayFavoritesMovies(notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let currentMovie = dict["currentMovie"] as? MoviesFill {
                self.checkIfMovieAlreadyExistsInArray(movie: currentMovie)
            }
        }
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
    }
    
    func checkIfMovieAlreadyExistsInArray(movie: MoviesFill){
        print("PASSEI POR AQUI")
        guard let array = arrayFavoritesMovies else {return}
        if !array.contains(obj: movie) {
            self.arrayFavoritesMovies?.append(movie)
            UserDefaults.standard.setIsFavorite(value: true)
        } else {
            arrayFavoritesMovies = self.arrayFavoritesMovies?.filter { $0 != movie}
            UserDefaults.standard.setIsFavorite(value: false)
        }
    }
}
