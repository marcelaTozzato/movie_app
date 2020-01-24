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
    var favoritesMovies: MoviesFill?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self
        
        createSavedFavoriteObserver()
    }
    
    func createSavedFavoriteObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(savedFavorite(notification:)), name: .savedFavorite, object: nil)
    }
   
    @objc func savedFavorite(notification: NSNotification) {
        self.favoritesMovies = Utils.getFavorite(key: "usersFavorite")
        self.favoritesTableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell
        cell?.setupCell(description: favoritesMovies?.title ?? "ERRO")
        return cell ?? UITableViewCell()
    }
}
