//
//  MoviesDataProvider.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 10/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesDataProviderDelegate: class {
    func sucessLoadMovie(movie: Movies)
    func failLoadMovie(error: NetworkingError?)
}

class MoviesDataProvider {
    
    weak var delegate: MoviesDataProviderDelegate?
    
    private let APIKey = "40cf48ef896219470665035ae96b624a"
    private let baseURL = "https://api.themoviedb.org/3/movie/popular?api_key=40cf48ef896219470665035ae96b624a&language=en-US&page=1"

    
    func loadMovies() {
        if let URL: URL = URL(string: baseURL){
            
            Alamofire.request(URL, method: .get).responseJSON { (response) in
              
                if response.response?.statusCode == 200 {
                    
                    do {
                        let decodeObject: Movies = try JSONDecoder().decode(Movies.self, from: response.data ?? Data())
                        self.delegate?.sucessLoadMovie(movie: decodeObject)
                        
                    } catch {
                        self.delegate?.failLoadMovie(error: .invalidResponse)
                    }
                    
                } else {
                    self.delegate?.failLoadMovie(error: .invalidRequest)
                }
            }
        }
    }
}

enum NetworkingError: String, Error {
    
    case invalidRequest = "Você fez uma requisição invalida"
    case invalidResponse = "Há alguma coisa errada com a resposta que recebemos"
}

extension NetworkingError: LocalizedError {
    
    var errorDescription: String? { return NSLocalizedString(rawValue, comment: "")}
}
