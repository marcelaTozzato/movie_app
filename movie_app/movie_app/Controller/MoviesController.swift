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
    var selectedIndex: Int = 0
    
    func setupController(moviesDataProviderDelegate: MoviesDataProviderDelegate) {
        provider = MoviesDataProvider()
        self.provider?.delegate = moviesDataProviderDelegate
    }
    
    func loadMovies(requestState: RequestState) {
        self.loadMovies(requestState: requestState, moviesDataProviderDelegate: self)
    }
    
    func loadMovies(requestState: RequestState, moviesDataProviderDelegate: MoviesDataProviderDelegate) {
        self.setupController(moviesDataProviderDelegate: moviesDataProviderDelegate)
        self.provider?.loadMovies(requestState: requestState)
    }

    func numberOfItensInSection() -> Int {
        return self.arrayMovies.count
    }
    
    func loadCurrentCell(indexPath: Int) -> Result {
        return arrayMovies[indexPath]
    }

}

extension MoviesController: MoviesDataProviderDelegate {
    func sucessLoadMovie(movie: Movies) {
        for value in movie.results {
            self.arrayMovies.append(value)
            self.delegate?.sucessLoadMovies()
        }
    }
    
    func failLoadMovie(error: NetworkingError?) {
        self.delegate?.failLoadMovies(error: error)
    }
    
    
}
