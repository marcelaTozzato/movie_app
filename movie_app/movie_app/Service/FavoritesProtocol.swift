//
//  FavoritesProtocol.swift
//  movie_app
//
//  Created by Marcela Tozzato on 28/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

typealias arrayFavoritesMovies<T> = (_ favoritesMovies: [T]) -> Void

protocol FavoritesProtocol {
    func getArrayFavoritesMovies(completion: arrayFavoritesMovies<MovieObject>)
    func setArrayFavoritesMovies(favoritesMovies: [MovieObject])
}
