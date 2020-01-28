//
//  MoviesProtocol.swift
//  movie_app
//
//  Created by Marcela Tozzato on 23/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire


typealias getMoviesObjectFromAPI<T> = (_ result: T, _ failure: NetworkingError?) -> Void

protocol MoviesProtocol {
    func loadMovies(page: Int, completion: @escaping getMoviesObjectFromAPI<ArrayMoviesObject?>)
}


