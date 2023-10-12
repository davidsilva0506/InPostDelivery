//
//  PersistanceLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import RealmSwift

public enum PersistanceError: Error {

    case noRealm
    case operationFailed
}

public protocol PersistanceLayerProtocol: AnyObject {

    func save(_ object: Object) throws
    func fetch<T: Object>(_ type: T.Type) throws -> Results<T>
}

class PersistanceLayer: PersistanceLayerProtocol {

    func save(_ object: Object) throws {
         
        guard let realm = try? Realm() else {

            throw PersistanceError.noRealm
        }
        
        do {

            try realm.write {
                
                realm.add(object, update: .modified)
             }
            
        } catch {
            
            throw PersistanceError.operationFailed
        }
    }
    
    func fetch<T: Object>(_ type: T.Type) throws -> Results<T> {
        
        guard let realm = try? Realm() else {
            
            throw PersistanceError.operationFailed
        }
        
        return realm.objects(type)
    }
}
