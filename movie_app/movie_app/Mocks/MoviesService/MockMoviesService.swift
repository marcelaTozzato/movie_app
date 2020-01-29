//
//  MoviesControllerMocks.swift
//  movie_app
//
//  Created by Marcela Limieri Tozzato on 13/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation
import Alamofire

class MockMoviesService: MockingURLProtocol {
 
    override func startLoading() {
        if let path = Bundle.main.path(forResource: "APIResponse", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                if let url = request.url,
                    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: self.getCannedHeaders()) {
                       client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: URLCache.StoragePolicy.notAllowed)
                       client?.urlProtocol(self, didLoad: data)
                   }
                client?.urlProtocolDidFinishLoading(self)
            }
            catch {
                
            }
        }
    }
}
        

