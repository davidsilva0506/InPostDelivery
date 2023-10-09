//
//  PackProvider.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import Foundation

protocol PackProvider: AnyObject {

    func fetchPacks() async throws -> [Pack]?
}
