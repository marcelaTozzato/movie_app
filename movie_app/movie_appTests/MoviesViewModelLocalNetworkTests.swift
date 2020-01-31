//
//  MoviesViewModelLocalNetworkTests.swift
//  movie_appTests
//
//  Created by Marcela Tozzato on 31/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MoviesViewModelLocalNetworkTests: XCTestCase {
    
    var sut: MoviesViewModel?
    var provider: MoviesService = MoviesService(session: .mock)
    var expect: XCTestExpectation?
    var movieAPIResponse: MovieAPIResponse?
    
    override func setUp() {
        super.setUp()
        sut = MoviesViewModel(delegate: nil, moviesProtocol: provider)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldGetMoviesWhenAllIsWorking() {
        expect = expectation(description: "GetMoviesFromAPI")
        sut?.moviesProtocol.loadMovies(page: 1, completion: { (response, error) in
            guard let response = response else {
                self.expect?.fulfill()
                return
            }
            self.movieAPIResponse = response
            self.expect?.fulfill()
        })
        guard let movies = movieAPIResponse else {return}
        XCTAssertEqual(movies.results.count, 20, "Validação do mock: o resultado está diferente de 20")
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
