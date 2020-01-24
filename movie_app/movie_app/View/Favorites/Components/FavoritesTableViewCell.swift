//
//  FavoritesTableViewCell.swift
//  movie_app
//
//  Created by Marcela Tozzato on 24/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet var titleLbl: UILabel!
    
    func setupCell(description: String){
        titleLbl.text = description
    }
}
