//
//  APIManager.swift
//  WeatherApp
//
//  Created by Onopriienko.Sergii on 13.12.2020.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<T> {
    case Sucsess(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, complitionHendler: @escaping JSONCompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
    
}

extension APIManager {
    
    func JSONTaskWith(request: URLRequest, complitionHandler: @escaping JSONCompletionHandler) -> JSONTask {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let HTTPResponse = response as? HTTPURLResponse else {
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                let error = NSError(domain: OSNetworkingErrorDomain, code: 100, userInfo: userInfo)
                complitionHandler(nil, nil, error)
                return
            }
            
            if data == nil {
                if let error = error {
                    complitionHandler(nil, HTTPResponse, error)
                }
            } else {
                switch HTTPResponse.statusCode {
                case 200:
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                        complitionHandler(json, HTTPResponse, nil)
                    } catch let error as NSError {
                        complitionHandler(nil, HTTPResponse, error)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
    
    func fetch<T>(request: URLRequest, parse: @escaping  ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void) {
        let dataTask = JSONTaskWith(request: request) { (json, response, error) in
            guard let json = json else {
                if let error = error {
                    completionHandler(.Failure(error))
                }
                return
            }
            if let value = parse(json) {
                completionHandler(.Sucsess(value))
            } else {
                let error = NSError(domain: OSNetworkingErrorDomain, code: 200, userInfo: nil)
                completionHandler(.Failure(error))
            }
        }
        dataTask.resume()
    }
}
