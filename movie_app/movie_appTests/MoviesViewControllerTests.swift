//
//  MoviesViewControllerTests.swift
//  movie_appTests
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MoviesViewControllerTests: XCTestCase, MoviesDataProviderDelegate {

    var sut: MoviesViewController?
//    var sut: MoviesController?
//    var provider: MoviesDataProvider?
//    var expect: XCTestExpectation?
//    var runTests = {
//        (movies: Movies) -> () in
//    }
//
//
    override func setUp() {
        super.setUp()

        sut = MoviesViewController()
//        provider = MoviesDataProvider()
//        expect = expectation(description: "GetSuccess3Movies")
//        runTests = {
//            (movies: Movies) -> () in
//            XCTAssertEqual(movies.results.count, 3, "Validação do mock: o resultado está diferente de 3")
//            XCTAssertEqual(self.sut?.arrayMovies.count, movies.results.count, "Validação do array de movies: o resultado deveria ser igual ao resultado do mock")
//        }
//
    }

    override func tearDown() {
        super.tearDown()
    }
//
//    func testShouldGetMoviesWhenAllIsWorking() {
//
//        sut?.loadMovies(sessionManager: RequestManager(mockingProtocol: MockingForSuccess3Movies.self).currentSessionManager(state: .mock), moviesDataProviderDelegate: self, page: 1)
//        waitForExpectations(timeout: 5.0, handler:  nil)
//    }
//
    func sucessLoadMovie(movie: Movies) {
//        expect?.fulfill()
//        sut?.sucessLoadMovie(movie: movie)
//        runTests(movie)
    }

    func failLoadMovie(error: NetworkingError?) {
//        expect?.fulfill()
    }
}
