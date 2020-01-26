//
//  MoviesCollectionViewCell.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 09/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit
import SDWebImage

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func setupCell(movie: MoviesFill?) {
        self.backgroundColor = Theme.current.cellBackground
        self.titleLbl.font = UIFont(name: Theme.current.font, size: 17)
        self.titleLbl.text = movie?.title
        self.image.sd_setImage(with: movie?.posterURL)
        
    }
}
