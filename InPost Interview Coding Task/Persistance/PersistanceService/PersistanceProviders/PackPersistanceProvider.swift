//
//  PackPersistanceProvider.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation

protocol PackPersistanceProvider: AnyObject {

    func archivePack(_ pack: Pack) throws
    func savePack(_ pack: Pack) throws
    func fetchPacks() throws -> [Pack]
}
