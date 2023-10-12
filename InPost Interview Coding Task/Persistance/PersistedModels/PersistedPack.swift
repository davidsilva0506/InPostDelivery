//
//  PersistedPack.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import RealmSwift

class PersistedPack: Object {

    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var status: String = ""
    @Persisted var sender: String = ""
    @Persisted var expiryDate: Date? = nil
    @Persisted var pickupDate: Date? = nil
    @Persisted var storedDate: Date? = nil
    @Persisted var shipmentType: String = ""
    @Persisted var isArchived: Bool? = nil
}
