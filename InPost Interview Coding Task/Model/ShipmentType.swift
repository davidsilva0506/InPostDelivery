//
//  ShipmentType.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 12/10/2023.
//

import Foundation

enum ShipmentType: String {

    case courier = "COURIER"
    case locker = "PARCEL_LOCKER"
    case unknown
}

extension ShipmentType: Codable {
    
    public init(from decoder: Decoder) throws {
        
        self = try ShipmentType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
