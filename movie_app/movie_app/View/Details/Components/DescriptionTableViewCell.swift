//
//  DescriptionTableViewCell.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

protocol DescriptionTableViewCellDelegate: class {
    func setFavorite()
    func isFavoriteMovie() -> Bool?
}

class DescriptionTableViewCell: UITableViewCell {
    
    weak var delegate: DescriptionTableViewCellDelegate?
    
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    
    func setupCell(description: String) {
        movieLbl.text = description
        
        movieLbl.textColor = Theme.current.textColor
        backgroundColor = Theme.current.ViewBackground
    }
    
    func setupButton() {
        guard let isFavorite = delegate?.isFavoriteMovie() else { return }
        if isFavorite {
            self.favoritesButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            self.favoritesButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func clickedFavoritesButton(_ sender: UIButton){
        delegate?.setFavorite()
        setupButton()
    }
}

