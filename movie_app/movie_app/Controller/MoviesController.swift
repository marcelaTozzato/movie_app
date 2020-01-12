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
    
    func setupController() {
        provider = MoviesDataProvider()
        self.provider?.delegate = self
    }
    
    func loadMovies() {
        self.setupController()
        self.provider?.loadMovies()
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
        self.arrayMovies = movie.results
        self.delegate?.sucessLoadMovies()
    }
    
    func failLoadMovie(error: NetworkingError?) {
        self.delegate?.failLoadMovies(error: error)
    }
    
    
}
