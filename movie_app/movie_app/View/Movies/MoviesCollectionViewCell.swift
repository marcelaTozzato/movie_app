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
    
    func getURLForImage(posterPath: String) -> URL? {
        let baseURL = "https://image.tmdb.org/t/p"
        let fileSize = "w500"
        
        return URL(string: "\(baseURL)/\(fileSize)/\(posterPath)")
    }
    
    func setupCell(movie: Result?) {
        self.backgroundColor = .customDarkBlue
        self.titleLbl.text = movie?.originalTitle
        self.image.sd_setImage(with: getURLForImage(posterPath: movie?.posterPath ?? "") )
    }
}
