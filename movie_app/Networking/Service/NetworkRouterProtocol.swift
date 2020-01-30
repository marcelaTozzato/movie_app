//
//  NetworkRouter.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

//O método request utiliza o endPoint para fazer requests e depois passa a resposta obtida atraves do completion
//Nós utilizamos o associatedtype para que o Router seja capaz de lidar com qualquer tipo de EndPointType. Caso contrário, o Router teria que ter um EndPointType concreto.

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
}
