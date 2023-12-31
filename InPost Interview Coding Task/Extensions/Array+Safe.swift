//
//  Array+Util.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation

public extension Array {
    
    subscript(safe index: Index) -> Element? {

        return index < endIndex && index >= startIndex ? self[index] : nil
    }
}
