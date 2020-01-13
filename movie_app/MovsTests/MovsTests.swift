//
//  MovsTests.swift
//  MovsTests
//
//  Created by Marcela Limieri Tozzato on 12/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MovsTests: XCTestCase, MoviesDataProviderDelegate {

    var controller: MoviesController?
    var provider: MoviesDataProvider?
    var expect: XCTestExpectation?
    var runTests = {
        (movies: Movies) -> () in
    }
        
    
    override func setUp() {
        super.setUp()
        controller = MoviesController()
        provider = MoviesDataProvider()
        expect = expectation(description: "GetSuccess3Movies")
        runTests = {
            (movies: Movies) -> () in
            XCTAssertEqual(movies.results.count, 3)
        }
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldGetMoviesWhenAllIsWorking() {
        let client = RequestState.mock
        
        controller?.loadMovies(requestState: client, moviesDataProviderDelegate: self)
        waitForExpectations(timeout: 5.0, handler:  nil)
    }
    
    func sucessLoadMovie(movie: Movies) {
        expect?.fulfill()
        runTests(movie)
    }
    
    func failLoadMovie(error: NetworkingError?) {
        expect?.fulfill()
    }

}

