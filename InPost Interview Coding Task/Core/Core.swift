//
//  Core.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation
import RealmSwift

final class Core: NSObject {
    
    let network: NetworkLayer
    let service: ServiceLayer
    let persistance: PersistanceLayer
    let persistanceService: PersistanceServiceLayer

    init(network: NetworkLayer,
         service: ServiceLayer,
         persistance: PersistanceLayer,
         persistanceService: PersistanceServiceLayer) {
        
        self.network = network
        self.service = service
        self.persistance = persistance
        self.persistanceService = persistanceService

        super.init()
    }
}
