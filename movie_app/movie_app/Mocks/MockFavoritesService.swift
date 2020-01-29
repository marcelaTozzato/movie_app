//
//  MockFavoritesService.swift
//  movie_app
//
//  Created by Marcela Tozzato on 29/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

class MockFavoritesService: FavoritesService {
    
    override func getArrayFavoritesMovies(completion: @escaping arrayFavoritesMovies<MovieObject>) {
        DispatchQueue.global().async {
            var json: [MovieObject] = []
            if let path = Bundle.main.path(forResource: "FavoritesResponse", ofType: "json") {
                do {
                    let fileUrl = URL(fileURLWithPath: path)
                    let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                    let decodedObject: [MovieObject] = try JSONDecoder().decode([MovieObject].self, from: data)
                    json = decodedObject
                } catch {
                    // Handle error here
                }
            
                completion(json)
            }
        }
    }
    
    override func setArrayFavoritesMovies(favoritesMovies: [MovieObject]) {
    }
    
    
}
