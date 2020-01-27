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
    @IBOutlet var yearLbl: UILabel!
    @IBOutlet var overviewLbl: UILabel!
    
    func setupCell(description: MoviesFill){
        titleLbl.text = description.title
        yearLbl.text = description.releaseYear
        overviewLbl.text = description.overview
        movieImage.sd_setImage(with: description.posterURL)
        
        titleLbl.textColor = Theme.current.textColor
        yearLbl.textColor = Theme.current.textColor
        overviewLbl.textColor = Theme.current.textColor
        backgroundColor = Theme.current.favoritesCellBackground
    }
    
}
