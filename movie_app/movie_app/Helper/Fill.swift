//
//  ObjectToFill.swift
//  movie_app
//
//  Created by Marcela Tozzato on 28/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class Fill {
    
    private static func getURLForImage(posterPath: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let fileSize = "w500"
        
        return URL(string: "\(baseURL)/\(fileSize)/\(posterPath)")
    }
    
    static func transformObjectInToFill(object: MovieObject) -> MoviesFill {
        let title = object.title
        let releaseYear = String(object.releaseDate).components(separatedBy: "-")[0]
        let overview = object.overview
        let posterURL = getURLForImage(posterPath: object.posterPath)
        
        return MoviesFill(title: title, releaseYear: releaseYear, overview: overview, posterURL: posterURL)
    }
}
