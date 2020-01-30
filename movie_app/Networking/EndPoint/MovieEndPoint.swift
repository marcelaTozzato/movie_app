//
//  MovieEndPoint.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class MovieAPI: EndPointType {
    var page: Int
    
    init(page: Int) {
        self.page = page
    }
    
    var baseURL: URL {
        let stringURL: String = "https://api.themoviedb.org/3/movie"
        guard let url = URL(string: stringURL) else {fatalError("baseURL could not be configured")}
        return url
    }
    
    var path: String = "popular"
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requestParameters(bodyParameters: nil, urlParameters: ["page": self.page, "api_key":"40cf48ef896219470665035ae96b624a", "language":"en-US"] )
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
