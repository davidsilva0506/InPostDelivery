//
//  PackPersistanceProvider.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation

protocol PackPersistanceProvider: AnyObject {

    func savePack(_ pack: Pack) throws
    func fetchPacks() throws -> [Pack]
}
