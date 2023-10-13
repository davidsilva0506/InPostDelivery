//
//  Pack.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import Foundation

struct Pack: Codable {

    let id: String
    let status: PackStatus
    let sender: String
    let expiryDate: Date?
    let pickUpDate: Date?
    let storedDate: Date?
    let shipmentType: ShipmentType
    
    var isArchived: Bool?
}

extension Pack {
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        case status
        case sender
        case expiryDate
        case pickUpDate
        case storedDate
        case shipmentType
    }
}
