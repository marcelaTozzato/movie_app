//
//  MoviesViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 22/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

protocol MoviesViewModelDelegate: class {
    func sucessLoadMovie()
    func failLoadMovie(error: String)
}

typealias MovieDetailNavigationData = (MovieObject?)

class MoviesViewModel {
    
    private var arrayMoviesObject: MovieAPIResponse?
    private var totalPages: Int = 1
    private var currentPage: Int = 1
    
    weak var delegate: MoviesViewModelDelegate?
    let moviesProtocol: MoviesProtocol
    
    init(delegate: MoviesViewModelDelegate?, moviesProtocol: MoviesProtocol = MoviesService()) {
        self.delegate = delegate
        self.moviesProtocol = moviesProtocol
    }
    
    func selectedMovie(index: Int) -> MovieDetailNavigationData {
        return self.arrayMoviesObject?.results[index]
    }
    
    func loadMovies(page: Int) {
        self.moviesProtocol.loadMovies(page: page) { (response, error) in
            guard let response = response else {
                self.delegate?.failLoadMovie(error: error?.localizedDescription ?? "")
                return }
            self.arrayMoviesObject = response
            self.setTotalMoviePages(movie: response)
            self.delegate?.sucessLoadMovie()
        }
    }
    
    func loadCurrentCell(index: Int) -> MoviesFill {
        guard let arrayMoviesObject = arrayMoviesObject else { return MoviesFill(title: "", releaseYear: "", overview: "") }
        return arrayMoviesObject.results[index].fill()
    }
    
    func numberOfItensInSection() -> Int {
        return self.arrayMoviesObject?.results.count ?? 0
    }
    
    func setTotalMoviePages(movie: MovieAPIResponse) {
        self.totalPages = movie.totalPages
    }
    
    func getTotalMoviePages() -> Int {
        return self.totalPages
    }
    
    func incrementCurrentPage() -> Bool {
        if self.currentPage < self.getTotalMoviePages() {
            self.currentPage += 1
            return true
        } else {
            return false
        }
    }
    
    func getCurrentPage() -> Int {
        return self.currentPage
    }
}
