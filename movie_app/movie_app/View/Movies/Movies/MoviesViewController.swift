//
//  MoviesViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 07/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    
    var sessionManager: SessionManager = RequestManager().currentSessionManager(state: .live)
    var controller: MoviesController?
    var fetchingMore: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        
        self.controller = MoviesController()
        self.controller?.delegate = self
        
        self.controller?.loadMovies(sessionManager: sessionManager, page: 1)
        
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10) / 2, height: collectionView.frame.width / 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controller?.selectedIndex = indexPath.row
        
        let storyBoard = UIStoryboard.init(name: "Movies", bundle: nil)
        
        guard let vc: DetailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        
        vc.currentMovie = controller?.arrayMovies[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller?.numberOfItensInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MoviesCollectionViewCell = MoviesCollectionViewCell.createCell(collectionView: collectionView, indexPath: indexPath)
        cell.setupCell(movie: controller?.loadCurrentCell(indexPath: indexPath.row))
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !fetchingMore {
                beginBatchFech()
            }
        }
    }
    
    func beginBatchFech() {
        fetchingMore = true
        print("BeginFetchingMore")
        
        self.controller?.loadMovies(sessionManager: sessionManager, page: 2)
        self.moviesCollectionView.reloadData()
        fetchingMore = false
    }
}

extension MoviesViewController: MoviesControllerDelegate {
    func sucessLoadMovies() {
        self.moviesCollectionView.reloadData()
    }
    
    func failLoadMovies(error: NetworkingError?) {
        print(error?.localizedDescription ?? "")
    }
}
