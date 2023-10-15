//
//  PackPersistanceProviderMock.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 15/10/2023.
//

import Foundation

final class PackPersistanceProviderMock: PersistanceProtocol & PackPersistanceProvider {
    
    private enum Constants {
    
        static let fileName = "packs"
        static let fileExtension = "json"
    }

    unowned let persistance: PersistanceLayerProtocol
    
    init(persistance: PersistanceLayerProtocol) {

        self.persistance = persistance
    }

    func archivePack(_ pack: Pack) throws {}
    func savePack(_ pack: Pack) throws {}
    func fetchPacks() throws -> [Pack] {
        
        guard let url = Bundle.main.url(forResource: Constants.fileName, withExtension: Constants.fileExtension) else {

            throw MockError.invalidURL
        }

        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        guard let packs = try? decoder.decode([Pack].self, from: data) else {
            
            throw MockError.parsingFailed
        }
        
        return packs
    }
}
