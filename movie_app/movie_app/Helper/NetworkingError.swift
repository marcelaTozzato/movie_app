//
//  NetworkingError.swift
//  movie_app
//
//  Created by Marcela Tozzato on 23/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

enum NetworkingError: String, Error {
    
    case invalidRequest = "Você fez uma requisição invalida"
    case invalidResponse = "Há alguma coisa errada com a resposta que recebemos"
}

extension NetworkingError: LocalizedError {
    
    var errorDescription: String? { return NSLocalizedString(rawValue, comment: "")}
}
