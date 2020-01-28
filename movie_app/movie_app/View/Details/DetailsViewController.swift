//
//  DetailsViewController.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 10/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import UIKit

enum SectionType: String {
    case image = "Image"
    case title = "Title"
    case release = "Release"
    case synopsis = "Synopsis"

    init(rawValue: String) {
        switch (rawValue) {
        case "Image": self = .image
        case "Title": self = .title
        case "Release": self = .release
        case "Synopsis": self = .synopsis
        default:
            self = .title
        }
    }
}

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var currentMovie: MoviesFill?
    var section: [String] = []
    var currentSession: SectionType?
    
    var descriptionCell: DescriptionTableViewCell?
    var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        
        section = ["Image", "Title", "Release", "Synopsis"]
        
        self.viewModel = DetailsViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        view.backgroundColor = Theme.current.ViewBackground
        detailTableView.backgroundColor = Theme.current.ViewBackground
        detailTableView.reloadData()
    }
    
    func setCurrentMovie(movie: MoviesFill) -> MoviesFill {
        return movie
    }
}

extension DetailsViewController: DescriptionTableViewCellDelegate {
    func getSavedFavorites() -> [MoviesFill] {
        guard let savedFavorites = viewModel?.getArrayFavoritesMovies() else { return [MoviesFill]() }
        return savedFavorites
    }
    
    func setFavorite(movie: MoviesFill) {
        self.viewModel?.setFavorite(movie: movie)
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        currentSession = SectionType(rawValue: section[indexPath.section])
        switch currentSession {
        case .image:
            let cell: ImageTableViewCell = ImageTableViewCell.createCell(tableView: tableView, indexPath: indexPath)
            cell.setupCell(posterPath: currentMovie?.posterURL)
            return cell
        case .title:
            let cell: DescriptionTableViewCell = DescriptionTableViewCell.createCell(tableView: tableView, indexPath: indexPath)
            cell.delegate = self
            cell.setupCell(description: currentMovie?.title ?? "")
            cell.currentMovie = self.currentMovie
            cell.setupButton()
            return cell
        case .release:
            let cell: DescriptionTableViewCell = DescriptionTableViewCell.createCell(tableView: tableView, indexPath: indexPath)
            cell.favoritesButton.isHidden = true
            cell.setupCell(description: currentMovie?.releaseYear ?? "")
            return cell
        case .synopsis:
            let cell: DescriptionTableViewCell = DescriptionTableViewCell.createCell(tableView: tableView, indexPath: indexPath)
            cell.favoritesButton.isHidden = true
            cell.setupCell(description: currentMovie?.overview ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        currentSession = SectionType(rawValue: section[indexPath.section])
        switch currentSession {
        case .image:
            return tableView.frame.height / 1.5
        case .title:
            return UITableView.automaticDimension
        case .release:
            return UITableView.automaticDimension
        case .synopsis:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
}