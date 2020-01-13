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
    static let shared = RequestManager()
    fileprivate let liveManager: SessionManager
    fileprivate let mockManager: SessionManager
    
    init(_ state: RequestState = .live) {
        
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [MockingURLProtocol.self]
            return configuration
        }()
        
        self.liveManager = SessionManager.default
        self.mockManager = SessionManager(configuration: configuration)
    }
    
    func getRequestManager(requestState:RequestState){
        if requestState == .live{
            
        }
    }
}

enum RequestState {
    case live
    case mock
    
    var session: SessionManager {
        switch self {
        case .live: return RequestManager.shared.liveManager
        case .mock: return RequestManager.shared.mockManager
        }
    }
}
