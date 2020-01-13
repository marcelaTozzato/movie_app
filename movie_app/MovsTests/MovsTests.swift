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
    
    override func setUp() {
        super.setUp()
        controller = MoviesController()
        provider = MoviesDataProvider()
        
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldGetMoviesWhenAllIsWorking() {
        
        self.provider?.delegate = self
        
        expect = expectation(description: "Get")
        controller?.loadMovies(requestState: .mock, moviesDataProviderDelegate: self)
        waitForExpectations(timeout: 5.0, handler:  nil)
    }
    
    func sucessLoadMovie(movie: Movies) {
        expect?.fulfill()
    }
    
    func failLoadMovie(error: NetworkingError?) {
        expect?.fulfill()
    }

}

