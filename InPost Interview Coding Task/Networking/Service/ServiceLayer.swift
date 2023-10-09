//
//  ServiceLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation
import UIKit

final class ServiceLayer: ServiceProtocol, PackProvider {
    
    internal unowned let network: NetworkLayerProtocol
    
    init(network: NetworkLayerProtocol) {

        self.network = network
    }
    
    func fetchPacks() async throws -> [Pack]? {

        let packRequest = PackRequest()
        
        var packs: [Pack]?

        do {
            
            packs = try await self.network.execute(type: [Pack].self, request: packRequest)
            
        } catch {
            
            throw error
        }
        
        return packs
    }
}
