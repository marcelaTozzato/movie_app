//
//  Router.swift
//  movie_app
//
//  Created by Marcela Tozzato on 30/01/20.
//  Copyright © 2020 Marcela Limieri Tozzato. All rights reserved.
//

import Foundation

//No método request criamos uma URLSession usando a session shared. É a forma mais simples de configurar uma URLSession, porém possui algumas limitações:
//Você não pode obter dados de forma incremental quando eles chegam do servidor.
//Você não pode personalizar significativamente o comportamento da conexão padrão.
//Sua capacidade de executar autenticação é limitada.
//Você não pode fazer downloads ou uploads em segundo plano quando o aplicativo não estiver em execução.
//Nós basicamente criamos a request chamando o método buildRequest e passando um EndPoint. Como um erro pode ser jogado pelo encoders, fazemos o do-try-catch e passamos para frente o retorno de response, data e error

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
//O método buildRequest é responsável por todo o trabalho duro do networking. É ele que vai converter o EndPointType em uma URLRequest (uma vez que isto está feito, podemos passar a URLRequest para a nossa session). Etapas do método:
    //Criamos uma variável do tipo URLRequest e passamos para ela a nossa baseURL e fazemos o append dos paths que vamos usar
    //Setamos o nosso httpMethod para ser igual ao nosso endPoint
    //Como nosso encoder pode jogar um erro, criamos um block do-try-catch (um bloco unico que vai abrigar todos os catchs)
    //Switch no route.task - dependendo da task, chamamos o encoder apropriado.
    
    
    private func buildRequest(from route: EndPointType) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            break
            case .requestParameters(let bodyParameters, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
                break
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionHeaders):
                self.addAdditionalHeaders(additionHeaders
                    , request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    //O método configuraParameters é responsável por encodar nossos parametros. Como a API espera receber os bodyParameters como JSON e a URLParameters como URL codificada, nós simplesmente passamos cada parametro para encoder adequado.
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoding.encode(urlRequest: &request, with: urlParameters)
            }
        }
    }
    
    //O método addAdditionalHeaders adiciona os heards adicionais como parte da request
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
