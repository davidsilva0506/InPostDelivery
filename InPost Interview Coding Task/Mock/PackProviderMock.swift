//
//  PackProviderMock.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 15/10/2023.
//

import Foundation

public enum MockError: Error {

    case invalidURL
    case parsingFailed
}

final class PackProviderMock: ServiceProtocol & PackProvider {
    
    unowned let network: NetworkLayerProtocol
    
    init(network: NetworkLayerProtocol) {

        self.network = network
    }
    
    func fetchPacks() async throws -> [Pack] {

        return []
    }
}
