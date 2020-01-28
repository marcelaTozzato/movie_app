//
//  FavoritesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class FavoritesViewModel {
    
    private var arrayFavoritesMovies: [MoviesFill] = []
    private let provider: FavoritesService
    
    init(provider: FavoritesService = FavoritesService()) {
        self.provider = provider
    }
    
    func getArrayFavoritesMovies() -> [MoviesFill] {
        self.provider.getArrayFavoritesMovies { (response) in
            self.arrayFavoritesMovies = response
        }
        return arrayFavoritesMovies
    }
}
