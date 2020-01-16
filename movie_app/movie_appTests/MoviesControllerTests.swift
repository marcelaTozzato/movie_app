//
//  MoviesControllerTests.swift
//  movie_appTests
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MoviesControllerTests: XCTestCase, MoviesDataProviderDelegate {

    var sut: MoviesController?
    var expect: XCTestExpectation?
    var runTests = {
        (movies: Movies) -> () in
    }
    
    override func setUp() {
        super.setUp()
        sut = MoviesController()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldGetMoviesWhenAllIsWorking() {
        
        expect = expectation(description: "GetSucess3Movies")
        
        let requestManager = RequestManager(mockingProtocol: MoviesControllerMockingForSuccess3Movies.self)
        
        sut?.loadMovies(sessionManager: requestManager.getSessionManager(state: .mock), moviesDataProviderDelegate: self, page: 1)
        
        runTests = {
            (movies: Movies) -> () in
            XCTAssertEqual(movies.results.count, 3, "Validação do mock: o resultado está diferente de 3")
            XCTAssertEqual(self.sut?.arrayMovies.count, movies.results.count, "Validação do array de movies: o resultado deveria ser igual ao resultado do mock")
        }
        waitForExpectations(timeout: 5.0, handler:  nil)
    }
    
    func sucessLoadMovie(movie: Movies) {
        sut?.sucessLoadMovie(movie: movie)
        runTests(movie)
        expect?.fulfill()
    }
    
    func failLoadMovie(error: NetworkingError?) {
        expect?.fulfill()
    }
}
