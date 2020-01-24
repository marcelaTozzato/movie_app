//
//  DescriptionTableViewCell.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    
    var currentMovie: MoviesFill?
    var arrayFavorites: [MoviesFill] = []
    var viewModel: FavoritesViewModel?
    
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    func setupCell(description: String) {
        movieLbl.text = description
    }
    
    @IBAction func clickedFavoritesButton(_ sender: UIButton){
        guard let currentMovie = currentMovie else {return}
//        viewModel?.setArrayFavoritesMovies(movie: currentMovie)
        arrayFavorites = Utils.getFavorite(key: "usersFavorite") ?? []
        arrayFavorites.append(currentMovie)
        print("ARRAY")
        for value in arrayFavorites{
            print (value.title)
        }
        Utils.setFavorite(value: arrayFavorites, key: "usersFavorite")
        NotificationCenter.default.post(name: .savedFavorite, object: nil)
    }
}
