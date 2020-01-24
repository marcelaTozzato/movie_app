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
    
    func setArrayFavoritesMovies() {
        arrayFavoritesMovies = Utils.getFavorite(key: "usersFavorite")
        NotificationCenter.default.addObserver(self, selector: #selector(appendArrayFavoritesMovies(notification:)), name: .savedFavorite, object: nil)
    }

    @objc func appendArrayFavoritesMovies(notification: NSNotification) {
        if let dict = notification.userInfo as NSDictionary? {
            if let currentMovie = dict["currentMovie"] as? MoviesFill {
                self.arrayFavoritesMovies?.append(currentMovie)
            }
        }
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
    }
}
