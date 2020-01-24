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

class MockDelegate: MoviesViewModelDelegate {
    
    var expect: XCTestExpectation?
    var queue: DispatchQueue?
    
    func sucessLoadMovie() {
        expect?.fulfill()
    }
    
    func failLoadMovie(error: String) {
        expect?.fulfill()
    }

}
