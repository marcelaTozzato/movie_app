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
    
    private let baseURL = "https://api.themoviedb.org"
    private let APIVersion = "3"
    private let APICategory = "movie"
    private let APIResource = "popular"
    private let APIKey = "40cf48ef896219470665035ae96b624a"
    private let APILanguage = "en-US"
    private let APIPage = "1"

    func getMoviesRequestURL() -> String {
        
        return "\(baseURL)/\(APIVersion)/\(APICategory)/\(APIResource)?api_key=\(APIKey)&language=\(APILanguage)&page=\(APIPage)"
    }
    
    
    func makeAPIRequest(method: HTTPMethod, requestState: RequestState, completion: @escaping (_ response: DataResponse<Any>) -> Void) {
        
        if let URL: URL = URL(string: getMoviesRequestURL()){
            
                requestState.session.request(URL, method: .get).responseJSON { (response) in
                               completion(response)
                           }
        }
    }
    
    func handleMovieList(movies: Movies) {
         self.delegate?.sucessLoadMovie(movie: movies)
        
    }

    
    func loadMovies(requestState: RequestState) {
        
        makeAPIRequest(method: .get, requestState: requestState) { (response) in
            if response.response?.statusCode == 200 {
                
                do {
                    let decodedObject: Movies = try JSONDecoder().decode(Movies.self, from: response.data ?? Data())
                    self.handleMovieList(movies: decodedObject)
                    
                } catch {
                    self.delegate?.failLoadMovie(error: .invalidResponse)
                }
                
            } else {
                self.delegate?.failLoadMovie(error: .invalidRequest)
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
