//
//  MoviesViewControllerTests.swift
//  movie_appTests
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import XCTest
@testable import Movs

class MoviesViewControllerTests: XCTestCase {

    var sut: MoviesViewController?
    var mockedController: MoviesController?

    override func setUp() {
        super.setUp()

        sut = MoviesViewController()
        mockedController = MoviesViewControllerMockingControllerForSuccess2Pages()
        sut?.controller = mockedController
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShouldIncrementCurrentPageWhenCurrentPageIsLessThanTotalPage(){
        
        sut?.loadMovies()
        XCTAssertEqual(sut?.getCurrentPage(), 1)
        XCTAssertEqual(sut?.incrementCurrentPage(), true)
        XCTAssertEqual(sut?.getCurrentPage(), 2)
        XCTAssertEqual(sut?.incrementCurrentPage(), false)
   }

}
