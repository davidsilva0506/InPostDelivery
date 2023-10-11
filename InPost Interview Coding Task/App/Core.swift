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
    var realm: Realm?

    init(network: NetworkLayer, service: ServiceLayer, realm: Realm?) {
        
        self.network = network
        self.service = service
        self.realm = realm

        super.init()
    }
}
