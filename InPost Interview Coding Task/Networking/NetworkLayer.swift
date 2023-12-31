//
//  NetworkLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

public enum NetworkError: Error {

    case invalidURL
    case invalidData
    case requestFailed
    case parsingFailed
}

public protocol NetworkLayerProtocol: AnyObject {

    var session: URLSession { get }
    func execute<T: Codable>(type: T.Type, request: Request) async throws -> T
}

class NetworkLayer: NetworkLayerProtocol {
    
    private let networkConfig: NetworkConfig
    internal let session: URLSession
    
    init(networkConfig: NetworkConfig) {
        
        self.networkConfig = networkConfig
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func execute<T>(type: T.Type, request: Request) async throws -> T where T: Decodable  {
        
        let data = try await self.data(for: request)

        do {

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            return try decoder.decode(type, from: data)

        } catch {

            throw NetworkError.parsingFailed
        }
    }
    
    func data(for request: Request) async throws -> Data {
        
        do {

            let URLRequest = try await self.buildURLRequest(for: request)
            let (data, response) = try await self.session.data(for: URLRequest)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {

                throw NetworkError.requestFailed
            }
            
            return data

        } catch {

            throw NetworkError.requestFailed
        }
    }
}

private extension NetworkLayer {

    private func buildURLRequest(for request: Request) async throws -> URLRequest {

        let URLString = "\(self.networkConfig.baseURL)/\(request.path)"
        
        guard let URL = URL(string: URLString) else { throw NetworkError.invalidURL }
        
        var URLRequest = URLRequest(url: URL)
        
        if case .URL(let params) = request.parameters {
            
            guard let params = params as? [String: String] else { throw NetworkError.invalidData }
            
            let queryItems: [URLQueryItem] = params.map { param in
                
                return URLQueryItem(name: param.key,
                                    value: param.value)
            }
            
            guard var components = URLComponents(string: URLString) else { throw NetworkError.invalidData }
            
            components.queryItems = queryItems
            URLRequest.url = components.url
        }
        
        guard let absoluteURLString = URLRequest.url?.absoluteString,
              let components = URLComponents(string: absoluteURLString) else {
         
            throw NetworkError.invalidData
        }
        
        URLRequest.url = components.url
        URLRequest.httpMethod = request.method.rawValue

        return URLRequest
    }
}
