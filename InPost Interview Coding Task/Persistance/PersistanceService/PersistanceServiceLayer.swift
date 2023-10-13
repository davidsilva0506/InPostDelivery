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
        
        let object = Self.mapToObject(pack)
        object.isArchived = true
        
        do {
            
            try self.persistance.save(object)
            
        } catch {
            
            throw error
        }
    }

    func savePack(_ pack: Pack) throws {
        
        let object = Self.mapToObject(pack)
        
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
            
            return packs.map { Self.mapFromObject($0) }
            
        } catch {
            
            throw error
        }
    }
}
