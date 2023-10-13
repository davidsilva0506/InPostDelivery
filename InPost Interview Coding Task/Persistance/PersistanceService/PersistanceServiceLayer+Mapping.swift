//
//  PersistanceServiceLayer+Mapping.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 13/10/2023.
//

import Foundation

extension PersistanceServiceLayer {
 
    static func mapToObject(_ pack: Pack) -> PersistedPack {
        
        let persistedPack = PersistedPack()
        
        persistedPack.id = pack.id
        persistedPack.status = pack.status.rawValue
        persistedPack.sender = pack.sender
        persistedPack.expiryDate = pack.expiryDate
        persistedPack.pickUpDate = pack.pickUpDate
        persistedPack.storedDate = pack.storedDate
        persistedPack.shipmentType = pack.shipmentType.rawValue
        
        if let isArchived = pack.isArchived {
            
            persistedPack.isArchived = isArchived
        }
        
        return persistedPack
    }
    
    static func mapFromObject(_ persistedPack: PersistedPack) -> Pack {
        
        let pack = Pack(id: persistedPack.id,
                        status: PackStatus(rawValue: persistedPack.status) ?? .unknown,
                        sender: persistedPack.sender,
                        expiryDate: persistedPack.expiryDate,
                        pickUpDate: persistedPack.pickUpDate,
                        storedDate: persistedPack.storedDate,
                        shipmentType: ShipmentType(rawValue: persistedPack.shipmentType) ?? .unknown,
                        isArchived: persistedPack.isArchived)
        
        return pack
    }
}
