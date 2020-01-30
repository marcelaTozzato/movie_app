//
//  File.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class MoviesService: MoviesProtocol {
    
    private let router = Router<MovieAPI>()
    
    func loadMovies(page: Int, completion: @escaping getMoviesObjectFromAPI<MovieAPIResponse?>) {
        router.request(MovieAPI(page: page)) { (data, response, error) in
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let decodedObject: MovieAPIResponse = try JSONDecoder().decode(MovieAPIResponse.self, from: data ?? Data())
                        completion(decodedObject, nil)
                    } catch {
                        completion(nil, .invalidResponse)
                    }
                } else {
                    completion(nil, .invalidRequest)
                }
            }
        }
    }
}
