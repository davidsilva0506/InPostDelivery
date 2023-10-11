//
//  PackListViewModel.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import Combine
import RealmSwift

enum PackState {

    case loading
    case loaded
    case error(Error)
}

final class PackListViewModel: NSObject {

    // MARK: Constants
    private enum Constants {}

    // MARK: - Properties
    private unowned let provider: PackProvider
    
    private var realm: Realm?
    private(set) var currentState = PassthroughSubject<PackState, Never>()
    private(set) var packs: [[Pack]] = []

    init(provider: PackProvider, realm: Realm?) {

        self.provider = provider
        self.realm = realm
    }
}

// MARK: - Requests
extension PackListViewModel {

    func fetchPacks(refreshing: Bool = false) {

        Task { [weak self] in

            guard let self else { return }

            if refreshing == false {
                
                self.currentState.send(.loading)
            }

            do {
                
                let packs = try await self.provider.fetchPacks()

                self.packs = self.groupPacks(packs)
                
                self.currentState.send(.loaded)
                
            } catch {
                
                self.currentState.send(.error(error))
            }
        }
    }
}

// MARK: - Helpers
private extension PackListViewModel {
 
    func groupPacks(_ packs: [Pack]) -> [[Pack]] {

        let readyPacks = packs.filter { $0.status.activityStatus == .ready }
        let otherPacks = packs.filter { $0.status.activityStatus == .other }

        let orderedReadyPacks = self.orderPacks(readyPacks)
        let orderedOtherPacks = self.orderPacks(otherPacks)

        return [orderedReadyPacks, orderedOtherPacks]
    }
 
    func orderPacks(_ packs: [Pack]) -> [Pack] {
        
        return packs.sorted {
            
            ($0.status.order,
             $0.pickupDate ?? Date.distantFuture,
             $0.expiryDate ?? Date.distantFuture,
             $0.storedDate ?? Date.distantFuture,
             $0.id)
            <
            ($1.status.order,
             $1.pickupDate ?? Date.distantFuture,
             $1.expiryDate ?? Date.distantFuture,
             $1.storedDate ?? Date.distantFuture,
             $1.id)
        }
    }
}
