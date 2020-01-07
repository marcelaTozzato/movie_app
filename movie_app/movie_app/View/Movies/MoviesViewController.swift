//
//  MoviesViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 07/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self

    }
}

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
