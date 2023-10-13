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
    
    func archivePack(_ pack: Pack) throws {
        
        let object = self.mapToObject(pack)
        object.isArchived = true
        
        do {
            
            try self.persistance.save(object)
            
        } catch {
            
            throw error
        }
    }

    func savePack(_ pack: Pack) throws {
        
        let object = self.mapToObject(pack)
        
        if let persistedObject = try? self.persistance.fetch(PersistedPack.self, primaryKey: object.id) {
            
            object.isArchived = persistedObject.isArchived
        }
        
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
        persistedPack.pickUpDate = pack.pickUpDate
        persistedPack.storedDate = pack.storedDate
        persistedPack.shipmentType = pack.shipmentType.rawValue
        
        if let isArchived = pack.isArchived {
            
            persistedPack.isArchived = isArchived
        }
        
        return persistedPack
    }
    
    func mapFromObject(_ persistedPack: PersistedPack) -> Pack {
        
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
