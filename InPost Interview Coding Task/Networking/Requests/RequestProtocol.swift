//
//  RequestProtocol.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

public enum HTTPMethod: String {

    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum RequestParams {

    case URL(_ : [String: Any]?)
}

public protocol Request {

    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams? { get }
}
