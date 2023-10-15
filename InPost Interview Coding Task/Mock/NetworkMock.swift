//
//  NetworkMock.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 15/10/2023.
//

import Foundation

final class NetworkMock: NetworkLayerProtocol {
    
    let session = URLSession(configuration: URLSessionConfiguration.default)
    
    func execute<T>(type: T.Type, request: Request) async throws -> T {
        
        throw NetworkError.invalidData
    }
}
