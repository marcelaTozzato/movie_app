//
//  MoviesController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 10/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesControllerDelegate: class {
    func sucessLoadMovies()
    func failLoadMovies(error: NetworkingError?)
}

class MoviesController {
    
    var provider: MoviesDataProvider?
    weak var delegate: MoviesControllerDelegate?
    
    var arrayMovies: [Result] = []
    var selectedIndex: Int = 0
    private var totalPages: Int = 1
    
    func setupController(moviesDataProviderDelegate: MoviesDataProviderDelegate) {
        provider = MoviesDataProvider()
        self.provider?.delegate = moviesDataProviderDelegate
    }
    
    func loadMovies(sessionManager: SessionManager, page: Int) {
        self.loadMovies(sessionManager: sessionManager, moviesDataProviderDelegate: self, page: page)
    }
    
    func loadMovies(sessionManager: SessionManager, moviesDataProviderDelegate: MoviesDataProviderDelegate, page: Int) {
        self.setupController(moviesDataProviderDelegate: moviesDataProviderDelegate)
        self.provider?.loadMovies(sessionManager: sessionManager, page: page)
    }

    func numberOfItensInSection() -> Int {
        return self.arrayMovies.count
    }
    
    func loadCurrentCell(indexPath: Int) -> Result {
        return arrayMovies[indexPath]
    }
    
    func setTotalMoviePages(movie: Movies) {
        self.totalPages = movie.totalPages
    }
    
    func getTotalMoviePages() -> Int {
        return self.totalPages
    }
}

extension MoviesController: MoviesDataProviderDelegate {
    func sucessLoadMovie(movie: Movies) {
        for value in movie.results {
            self.arrayMovies.append(value)
            self.setTotalMoviePages(movie: movie)
            self.delegate?.sucessLoadMovies()
        }
    }
    
    func failLoadMovie(error: NetworkingError?) {
        self.delegate?.failLoadMovies(error: error)
    }
}
