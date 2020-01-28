//
//  DetailsViewModel.swift
//  movie_app
//
//  Created by Marcela Tozzato on 27/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    private var detailMovie: MovieResult?
    private var arrayFavoritesMovies: [MoviesFill] = Utils.getFavorite(key: "usersFavorite") ?? [MoviesFill]()
    
    func prepareForNavigation(navigationData: MovieDetailNavigationData){
        self.detailMovie = navigationData.movies?.results[navigationData.index]
    }
    
    func getCurrentMovie() -> MoviesFill {
        guard let detailMovie = detailMovie else {return MoviesFill(title: "", releaseYear: "", overview: "", posterURL: nil)}
        let title = detailMovie.title
        let releaseYear = String(detailMovie.releaseDate).components(separatedBy: "-")[0]
        let overview = detailMovie.overview
        let posterURL = self.getURLForImage(posterPath: detailMovie.posterPath)
        
        return MoviesFill(title: title, releaseYear: releaseYear, overview: overview, posterURL: posterURL)
    }
    
    
    func getURLForImage(posterPath: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let fileSize = "w500"
        
        return URL(string: "\(baseURL)/\(fileSize)/\(posterPath)")
    }
    
    func checkIfMovieAlreadyExistsInArray(movie: MoviesFill) {
        if !arrayFavoritesMovies.contains(obj: movie) {
            self.arrayFavoritesMovies.append(movie)
        } else {
            arrayFavoritesMovies = self.arrayFavoritesMovies.filter {$0 != movie}
        }
    }
    
    func setFavorite(movie: MoviesFill) {
        self.checkIfMovieAlreadyExistsInArray(movie: movie)
        Utils.setFavorite(value: arrayFavoritesMovies, key: "usersFavorite")
    }
    
    func getArrayFavoritesMovies() -> [MoviesFill] {
        return arrayFavoritesMovies
    }
}
