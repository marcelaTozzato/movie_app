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
    lazy var viewModel: FavoritesViewModel = FavoritesViewModel()
    
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    func setupCell(description: String) {
        movieLbl.text = description
    }
    
    func setupButton() {
        let isFavorite: Bool = viewModel.getArrayFavoritesMovies().contains(obj: currentMovie)
        if isFavorite {
            self.favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.favoritesButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func clickedFavoritesButton(_ sender: UIButton){
        guard let currentMovie = currentMovie else {return}
        viewModel.setArrayFavoritesMovies()
        let currentMovieDataDict = ["currentMovie": currentMovie]
        NotificationCenter.default.post(name: .savedFavorite, object: nil, userInfo: currentMovieDataDict)
        setupButton()
    }
}

