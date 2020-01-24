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

class MoviesViewModel {
    
    var arrayMoviesFill: [MoviesFill] = []
    var totalPages: Int = 1
    var currentPage: Int = 1
    
    weak var delegate: MoviesViewModelDelegate?
    let moviesProtocol: MoviesProtocol
    
    init(delegate: MoviesViewModelDelegate?, moviesProtocol: MoviesProtocol = MoviesDataProvider()) {
        self.delegate = delegate
        self.moviesProtocol = moviesProtocol
    }
    
    func loadMovies(page: Int) {
        self.moviesProtocol.loadMovies(page: page) { (response, error) in
            guard let response = response else {
                self.delegate?.failLoadMovie(error: error?.localizedDescription ?? "")
                return }
            self.arrayMoviesFill.append(contentsOf: response.results.map{self.fill(value: $0)})
            self.setTotalMoviePages(movie: response)
            self.delegate?.sucessLoadMovie()
        }
    }
    
    func fill(value: MovieResult) -> MoviesFill {
        
        let title = value.title
        let overview = value.overview
        let releaseYear = String(value.releaseDate).components(separatedBy: "-")[0]
        let posterURL = self.getURLForImage(posterPath: value.posterPath)
        
        return MoviesFill(title: title, releaseYear: releaseYear, overview: overview, posterURL: posterURL)
    }
    
    func getURLForImage(posterPath: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let fileSize = "w500"
        
        return URL(string: "\(baseURL)/\(fileSize)/\(posterPath)")
    }
    
    func loadCurrentCell(indexPath: Int) -> MoviesFill {
        return arrayMoviesFill[indexPath]
    }
    
    func numberOfItensInSection() -> Int {
        return self.arrayMoviesFill.count
    }
    
    func setTotalMoviePages(movie: MoviesObject) {
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

