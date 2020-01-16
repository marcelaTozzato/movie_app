//
//  RequestManager.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 12/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    fileprivate let liveManager: SessionManager
    fileprivate let mockManager: SessionManager
    
    init(mockingProtocol: MockingURLProtocol.Type = MockingURLProtocol.self) {
        
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [mockingProtocol.self]
            return configuration
        }()
        
        self.liveManager = SessionManager.default
        self.mockManager = SessionManager(configuration: configuration)
    }
    
    func getSessionManager(state: RequestState) -> SessionManager {
        switch state {
        case .live:
            return liveManager
        case .mock:
            return mockManager
        }
    }
}

enum RequestState {
    case live
    case mock
}

