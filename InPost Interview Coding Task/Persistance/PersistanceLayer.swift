//
//  PersistanceLayer.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import RealmSwift

public enum PersistanceError: Error {

    case realmFailed
    case operationFailed
}

public protocol PersistanceLayerProtocol: AnyObject {

    func save(_ object: Object) throws
    func fetch<T: Object>(_ type: T.Type) throws -> Results<T>
    func fetch<T: Object>(_ type: T.Type, primaryKey: Any) throws -> T?
}

class PersistanceLayer: PersistanceLayerProtocol {

    func save(_ object: Object) throws {
         
        guard let realm = try? Realm() else {

            throw PersistanceError.realmFailed
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
            
            throw PersistanceError.realmFailed
        }
        
        return realm.objects(type)
    }
    
    func fetch<T: Object>(_ type: T.Type, primaryKey: Any) throws -> T? {
        
        guard let realm = try? Realm() else {
            
            throw PersistanceError.realmFailed
        }
        
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }
}
