//
//  MoviesControllerTests.swift
//  movie_appTests
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MoviesViewModelTests: XCTestCase {
    
    var sut: MoviesViewModel?
    var provider: MoviesService = MoviesService()
    var expect: XCTestExpectation?
    var runTests = {
        (movies: ArrayMoviesObject) -> () in
    }
    
    override func setUp() {
        super.setUp()
        sut = MoviesViewModel(delegate: nil, moviesProtocol: provider)
        
        let requestManager = RequestManager(mockingProtocol: MoviesControllerMockingForSuccess3Movies.self)
        
        provider.setSessionManager(sessionManager: requestManager.getSessionManager(state: .mock))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldGetMoviesWhenAllIsWorking() {
        
        expect = expectation(description: "GetSucess3Movies")
        
        sut?.moviesProtocol.loadMovies(page: 1, completion: { (response, error) in
            guard let response = response else {
                self.expect?.fulfill()
                return
            }
            self.runTests(response)
            self.expect?.fulfill()
        })
        
        runTests = {
            (movies: ArrayMoviesObject) -> () in
            XCTAssertEqual(movies.results.count, 3, "Validação do mock: o resultado está diferente de 3")
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testShouldAppendArrayMoviesFill(){
        
        var delegate: MoviesViewModelMockDelegate?
        delegate = MoviesViewModelMockDelegate()
        delegate?.expect = expectation(description: "Append3Movies")
        sut?.delegate = delegate
        sut?.loadMovies(page: 1)
        waitForExpectations(timeout: 5.0)
        
        XCTAssertEqual(self.sut?.numberOfItensInSection(), 3)
    }
}
