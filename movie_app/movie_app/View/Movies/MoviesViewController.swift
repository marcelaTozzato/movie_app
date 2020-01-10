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
    
    var controller: MoviesController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        
        self.controller = MoviesController()
        self.controller?.delegate = self
        
        self.controller?.loadMovies()
        
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10) / 2, height: collectionView.frame.width / 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as? MoviesCollectionViewCell
        cell?.backgroundColor = UIColor.customDarkBlue
        return cell ?? UICollectionViewCell()
    }
    
}

extension MoviesViewController: MoviesControllerDelegate {
    func sucessLoadMovies() {
        print("Sucesso")
        print(controller?.arrayMovies[0].originalTitle ?? "")
    }
    
    func failLoadMovies(error: NetworkingError?) {
        print("Falha")
        print(error?.localizedDescription ?? "")
    }
}
