//
//  FavoritesTableViewCell.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit
import SDWebImage

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var movieImage: UIImageView!
    
    func setupCell(description: MoviesFill){
        titleLbl.text = description.title
        movieImage.sd_setImage(with: description.posterURL)
        titleLbl.textColor = Theme.current.textColor
        UITableViewCell.appearance().backgroundColor = Theme.current.background
    }
}
