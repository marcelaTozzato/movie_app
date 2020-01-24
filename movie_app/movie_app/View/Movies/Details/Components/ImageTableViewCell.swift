//
//  ImageTableViewCell.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    func setupCell(posterPath: URL?) {
        self.movieImage.sd_setImage(with: posterPath)
    }
}
