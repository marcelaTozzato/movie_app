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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoritesTableView.delegate = self
        self.favoritesTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.savedFavorites = Utils.getFavorite(key: "usersFavorite")
        self.favoritesTableView.reloadData()
        self.favoritesTableView.backgroundColor = Theme.current.background
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
