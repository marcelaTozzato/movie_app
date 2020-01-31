//
//  MockRouter.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

enum Session {
    case live
    case mock
}

class RouterManager {
    
    let liveManager: NetworkRouter = Router()
    let mockManager: NetworkRouter = RouterMock()
    

    func changeSession(session: Session) -> NetworkRouter {
        switch session {
        case .live:
            return liveManager
        case .mock:
            return mockManager
        }
    }
}

class RouterMock: NetworkRouter {
    
    func getCannedHeaders() -> [String: String]{
        return ["Content-Type" : "application/json; charset=utf-8"]
    }
    
    func request(_ route: EndPointType, completion: @escaping NetworkRouterCompletion) {
        if let path = Bundle.main.path(forResource: "APIResponse", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let response = HTTPURLResponse(url: route.baseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: self.getCannedHeaders())
                completion(data, response, nil)
            } catch {
                
            }
        }
    }
}
