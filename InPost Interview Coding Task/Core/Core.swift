//
//  Core.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

final class Core: NSObject {
    
    let network: NetworkLayerProtocol
    let service: ServiceProtocol & PackProvider
    let persistance: PersistanceLayerProtocol
    let persistanceService: PersistanceProtocol & PackPersistanceProvider

    init(network: NetworkLayerProtocol,
         service: ServiceProtocol & PackProvider,
         persistance: PersistanceLayerProtocol,
         persistanceService: PersistanceProtocol & PackPersistanceProvider ) {
        
        self.network = network
        self.service = service
        self.persistance = persistance
        self.persistanceService = persistanceService

        super.init()
    }
}
