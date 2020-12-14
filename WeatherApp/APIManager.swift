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
    
    func JSONTaskWith(request: URLRequest, complitionHendler: JSONCompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
}
