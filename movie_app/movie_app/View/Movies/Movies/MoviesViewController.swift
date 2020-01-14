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
    private var currentPage: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        
        self.controller = MoviesController()
        self.controller?.delegate = self
        
        self.controller?.loadMovies(sessionManager: sessionManager, page: currentPage)
        
    }
    
    func incrementCurrentPage() -> Bool {
        guard let controller = controller else {return false}
        if self.currentPage <= controller.getTotalMoviePages() {
            self.currentPage += 1
            return true
        } else {
            return false
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        print("fetchingMore")
        if incrementCurrentPage() {
        self.controller?.loadMovies(sessionManager: sessionManager, page: currentPage)
        self.moviesCollectionView.reloadData()
        }
        fetchingMore = false
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
                beginBatchFetch()
            }
        }
    }
}

extension MoviesViewController: MoviesControllerDelegate {
    func sucessLoadMovies() {
        self.moviesCollectionView.reloadData()
    }
    
    func failLoadMovies(error: NetworkingError?) {
        print(error?.localizedDescription ?? "")
        //TODO: Rever erros de invalid response que estou recebendo na pagina 4 (aparentemente um problema de parsing)
    }
}
