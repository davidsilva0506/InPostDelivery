//
//  PersistanceLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import RealmSwift

public enum PersistanceError: Error {

    case operationFailed
}

public protocol PersistanceLayerProtocol: AnyObject {

    func save(_ object: Object) throws
    func fetch<T: Object>(_ type: T.Type) throws -> Results<T>
}

class PersistanceLayer: PersistanceLayerProtocol {

    @MainActor
    func save(_ object: Object) throws {
         
        guard let realm = try? Realm() else {
            
            throw PersistanceError.operationFailed
        }
            
        do {

            realm.beginWrite()
            realm.add(object)
            try realm.commitWrite()
            
        } catch {
            
            throw PersistanceError.operationFailed
        }
    }
    
    @MainActor
    func fetch<T: Object>(_ type: T.Type) throws -> Results<T> {
        
        guard let realm = try? Realm() else {
            
            throw PersistanceError.operationFailed
        }
        
        return realm.objects(type)
    }
}
