//
//  Core.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

final class Core: NSObject {
    
    let network: NetworkLayer
    let service: ServiceLayer

    init(network: NetworkLayer, service: ServiceLayer) {
        
        self.network = network
        self.service = service
        
        super.init()
    }
}
