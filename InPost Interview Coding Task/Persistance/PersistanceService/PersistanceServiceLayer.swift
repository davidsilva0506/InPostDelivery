//
//  PersistanceServiceLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation

final class PersistanceServiceLayer: PersistanceProtocol, PackPersistanceProvider {
    
    internal unowned let persistance: PersistanceLayerProtocol
    
    init(persistance: PersistanceLayerProtocol) {

        self.persistance = persistance
    }

    func savePack(_ pack: Pack) throws {
        
        let object = self.mapToObject(pack)
        
        do {
            
            try self.persistance.save(object)
            
        } catch {
            
            throw error
        }
    }

    func fetchPacks() throws -> [Pack] {
        
        do {
            
            let packs = try self.persistance.fetch(PersistedPack.self)
            
            return packs.map { self.mapFromObject($0) }
            
        } catch {
            
            throw error
        }
    }
}

private extension PersistanceServiceLayer {
    
    func mapToObject(_ pack: Pack) -> PersistedPack {
        
        let persistedPack = PersistedPack()
        
        persistedPack.id = pack.id
        persistedPack.status = pack.status.rawValue
        persistedPack.sender = pack.sender
        persistedPack.expiryDate = pack.expiryDate
        persistedPack.pickupDate = pack.pickupDate
        persistedPack.storedDate = pack.storedDate
        persistedPack.shipmentType = pack.shipmentType
        
        return persistedPack
    }
    
    func mapFromObject(_ persistedPack: PersistedPack) -> Pack {
        
        let pack = Pack(id: persistedPack.id,
                        status: PackStatus(rawValue: persistedPack.status) ?? .unknown,
                        sender: persistedPack.sender,
                        expiryDate: persistedPack.expiryDate,
                        pickupDate: persistedPack.pickupDate,
                        storedDate: persistedPack.storedDate,
                        shipmentType: persistedPack.shipmentType)
        
        return pack
    }
}
