//
//  ShipmentType+Helper.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import Foundation

extension ShipmentType {
    
    var imageName: String {
        
        switch self {
            
            case .courier: return "Kurier"
            case .locker: return "Paczkomat"
            case .unknown: return ""
        }
    }
}
