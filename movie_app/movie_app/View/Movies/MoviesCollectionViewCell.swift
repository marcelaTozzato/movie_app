//
//  MoviesCollectionViewCell.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 09/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func setupCell(movie: Result?) {
        self.backgroundColor = .customDarkBlue
        self.titleLbl.text = movie?.originalTitle
    }
}
