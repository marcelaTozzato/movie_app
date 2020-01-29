//
//  DetailsViewModelTests.swift
//  movie_appTests
//
//  Created by Marcela Tozzato on 29/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class DetailsViewModelTests: XCTestCase {
    
    var sut: DetailsViewModel?

    override func setUp() {
        super.setUp()
        
        sut = DetailsViewModel(delegate: nil, favoritesProtocol: MockFavoritesService())
    }

    override func tearDown() {
        
        super.tearDown()
    }
    
    func getCurrentMovie(id: Int) {
        var delegate: DetailsViewModelMockDelegate?
        delegate = DetailsViewModelMockDelegate()
        delegate?.expect = expectation(description: "MovieIsFavorite")
        sut?.delegate = delegate
        
         let currentMovie: MovieObject = MovieObject(popularity: 0, voteCount: 0, video: true, posterPath: "", id: id, adult: true, backdropPath: "", originalLanguage: "", originalTitle: "", genreIDS: [], title: "", voteAverage: 0, overview: "", releaseDate: "")
        sut?.fetchArrayFavoritesMovies()
        waitForExpectations(timeout: 5.0)
        sut?.prepareForNavigation(navigationData: currentMovie)
    }
    
    func testIfMovieIsFavorite() {

        self.getCurrentMovie(id: 530915)
        XCTAssertEqual(self.sut?.isFavoriteMovie(), true, "O filme é favorito, porém o método isFavoriteMovie() está retornando false")
    }
    
    
    func testIfAFavoriteMovieHasBeenAddedToTheArray() {
        self.getCurrentMovie(id: 530915)
        sut?.setFavorite()
        XCTAssertEqual(sut?.arrayFavoritesMovies.count, 19, "O usuário tentou remover um filme da lista de favoritos e não conseguiu")
    }
    
    func testIfAFavoriteMovieHasNotBeenAddedToTheArray() {
        self.getCurrentMovie(id: 0)
        sut?.setFavorite()
        XCTAssertEqual(sut?.arrayFavoritesMovies.count, 21, "O usuário tentou adicionar um filme à lista de favoritos e não conseguiu")
    }

}
