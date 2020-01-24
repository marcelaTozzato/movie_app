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
    
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    func setupCell(description: String) {
        movieLbl.text = description
    }
    
    @IBAction func clickedFavoritesButton(_ sender: UIButton){
        Utils.setFavorite(value: currentMovie, key: "usersFavorite")
    }
}
