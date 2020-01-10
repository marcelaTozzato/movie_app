//
//  DetailsViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 10/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var titleLbl: UILabel!
    var controller: MoviesController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if controller == nil {
            controller = MoviesController()
        }
        
        guard let controller = controller else {return}
        let currentMovie = controller.loadCurrentCell(indexPath: controller.selectedIndex)
        
        self.titleLbl.text = currentMovie.title

    }

}
