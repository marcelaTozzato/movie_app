//
//  MockDelegate.swift
//  movie_app
//
//  Created by Marcela Tozzato on 23/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import XCTest
@testable import Movs

class MoviesViewModelMockDelegate: MoviesViewModelDelegate {
    
    var expect: XCTestExpectation?
    
    func sucessLoadMovie() {
        expect?.fulfill()
    }
    
    func failLoadMovie(error: String) {
        expect?.fulfill()
    }
}

class DetailsViewModelMockDelegate: DetailsViewModelDelegate {
    
    var expect: XCTestExpectation?
    
    func reloadData() {
        expect?.fulfill()
    }
}
