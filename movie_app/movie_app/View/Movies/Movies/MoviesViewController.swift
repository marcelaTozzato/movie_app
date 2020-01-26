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
    
    fileprivate lazy var viewModel: MoviesViewModel = MoviesViewModel(delegate: self)
    var fetchingMore: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        
        loadMovies()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        view.backgroundColor = Theme.current.ViewBackground
        moviesCollectionView.backgroundColor = Theme.current.ViewBackground
        moviesCollectionView.reloadData()
    }
    
    func loadMovies() {
        viewModel.loadMovies(page: viewModel.getCurrentPage())
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        print("fetchingMore")
        if viewModel.incrementCurrentPage() {
            self.viewModel.loadMovies(page: viewModel.getCurrentPage())
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
        
        let storyBoard = UIStoryboard.init(name: "Movies", bundle: nil)
        
        guard let vc: DetailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController else {return}
        
        vc.currentMovie = viewModel.arrayMoviesFill[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItensInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MoviesCollectionViewCell = MoviesCollectionViewCell.createCell(collectionView: collectionView, indexPath: indexPath)
        cell.setupCell(movie: viewModel.loadCurrentCell(indexPath: indexPath.row))
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

extension MoviesViewController: MoviesViewModelDelegate {
    func sucessLoadMovie() {
        self.moviesCollectionView.reloadData()
    }
    
    func failLoadMovie(error: String) {
        print(error)
    } 
}
