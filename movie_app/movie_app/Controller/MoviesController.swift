//
//  MoviesController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 10/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

protocol MoviesControllerDelegate: class {
    func sucessLoadMovies()
    func failLoadMovies(error: NetworkingError?)
}

class MoviesController {
    
    var provider: MoviesDataProvider?
    weak var delegate: MoviesControllerDelegate?
    
    var arrayMovies: [Result] = []
    
    func setupController() {
        provider = MoviesDataProvider()
        self.provider?.delegate = self
    }
    
    func loadMovies() {
        self.setupController()
        self.provider?.loadMovies()
    }
}

extension MoviesController: MoviesDataProviderDelegate {
    func sucessLoadMovie(movie: Movies) {
        self.arrayMovies = movie.results
        self.delegate?.sucessLoadMovies()
    }
    
    func failLoadMovie(error: NetworkingError?) {
        self.delegate?.failLoadMovies(error: error)
    }
    
    
}
