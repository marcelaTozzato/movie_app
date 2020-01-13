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
    
    func getURLForImage(posterPath: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let fileSize = "original"
        
        return URL(string: "\(baseURL)/\(fileSize)/\(posterPath)")
    }
    
    func setupCell(posterPath: String) {
        self.movieImage.sd_setImage(with: getURLForImage(posterPath: posterPath) )
    }

}
