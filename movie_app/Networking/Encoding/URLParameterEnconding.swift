//
//  URLParameterEconding.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

//O método encode pega os parametros e os transforma para que sejam seguros para serem passados como parametros da URL. Cuidamos das seguintes condições:
//Alguns caracteres são proibidos em URLs, portanto se nao conseguirmos obter a url do parametro urlRequest, o método joga um erro
//Os parametros devem ser separados por "&" (fazemos isso no queryItens)
//Se a request não tiver headers apropriados, nós vamos seta-los

public struct URLParameterEncoding: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
       
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}
