//
//  FavoritesViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 07/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet var favoritesTableView: UITableView!
    var savedFavorites: [MoviesFill]?
    var favoritesViewModel: FavoritesViewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.favoritesViewModel = FavoritesViewModel()
        
        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.savedFavorites = favoritesViewModel.getArrayFavoritesMovies()
        self.view.backgroundColor = Theme.current.ViewBackground
        self.favoritesTableView.backgroundColor = Theme.current.ViewBackground
        setNeedsStatusBarAppearanceUpdate()
        self.favoritesTableView.reloadData()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return Theme.current.statusBarStyle
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedFavorites?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell
        guard let savedFavorites = savedFavorites else {return UITableViewCell()}
        cell?.setupCell(description: savedFavorites[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
