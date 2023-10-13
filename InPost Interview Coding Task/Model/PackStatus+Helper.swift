//
//  PackStatus+Helper.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation

extension PackStatus {

    enum PackActivityStatus {

        case ready
        case other
        case unknown
    }

    var text: String {

        return self.rawValue.capitalized.replacingOccurrences(of: "_", with: " ")
    }
    
    var activityStatus: PackActivityStatus {
        
        switch self {
            
            case .outForDelivery,
                 .readyToPickUp,
                 .pickUpTimeExpired:
            
                return .ready
        
            case .created,
                 .confirmed,
                 .adoptedAtSourceBranch,
                 .sentFromSourceBranch,
                 .adoptedAtSortingCenter,
                 .sentFromSortingCenter,
                 .other,
                .delivered,
                .returnedToSender,
                .avizo,
                .notReady:
            
                return .other
            
            case .unknown:
            
                return .unknown
        }
    }
    
    var order: Int {
        
        switch self {

            case .created: return 0
            case .confirmed: return 1
            case .adoptedAtSourceBranch: return 2
            case .sentFromSourceBranch: return 3
            case .adoptedAtSortingCenter: return 4
            case .sentFromSortingCenter: return 5
            case .other: return 6
            case .delivered: return 7
            case .returnedToSender: return 8
            case .avizo: return 9
            case .outForDelivery: return 10
            case .readyToPickUp: return 11
            case .pickUpTimeExpired: return 12
            case .notReady: return 13
            case .unknown: return 100
        }
    }
}
