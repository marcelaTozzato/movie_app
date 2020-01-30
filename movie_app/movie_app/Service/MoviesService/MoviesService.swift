////
////  MoviesDataProvider.swift
////  movie_app
////
////  Created by Marcela Limieri Tozzato on 10/01/20.
////  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//class MoviesService: MoviesProtocol {
//    
//    fileprivate var sessionManager: SessionManager = RequestManager().getSessionManager(state: .live)
//    
//    fileprivate let baseURL = "https://api.themoviedb.org"
//    fileprivate let APIVersion = "3"
//    fileprivate let APICategory = "movie"
//    fileprivate let APIResource = "popular"
//    fileprivate let APIKey = "40cf48ef896219470665035ae96b624a"
//    fileprivate let APILanguage = "en-US"
//    
//    func setSessionManager(sessionManager: SessionManager) {
//        self.sessionManager = sessionManager
//    }
//    
//    private func getMoviesRequestURL(page: Int) -> String {
//        
//        return "\(baseURL)/\(APIVersion)/\(APICategory)/\(APIResource)?api_key=\(APIKey)&language=\(APILanguage)&page=\(page)"
//    }
//    
//    func loadMovies(page: Int, completion: @escaping getMoviesObjectFromAPI<MovieAPIResponse?>) {
//                if let URL: URL = URL(string: getMoviesRequestURL(page: page)) {
//                    self.sessionManager.request(URL, method: .get).responseJSON { (response) in
//                if response.response?.statusCode == 200 {
//                    do {
//                        let decodedObject: MovieAPIResponse = try JSONDecoder().decode(MovieAPIResponse.self, from: response.data ?? Data())
//                        completion(decodedObject, nil)
//                    } catch {
//                        completion(nil, .invalidResponse)
//                    }
//                } else {
//                    completion(nil, .invalidRequest)
//                }
//            }
//        }
//    }
//}
//
