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
    case archiveCompleted(IndexPath)
    case error(Error)
}

final class PackListViewModel: NSObject {

    // MARK: Constants
    private enum Constants {}

    // MARK: - Properties
    private unowned let provider: PackProvider
    private unowned let persistanceProvider: PackPersistanceProvider
    
    private var realm: Realm?
    private(set) var currentState = PassthroughSubject<PackState, Never>()
    var packs: [[Pack]] = []

    init(provider: PackProvider, persistanceProvider: PackPersistanceProvider) {

        self.provider = provider
        self.persistanceProvider = persistanceProvider
    }
}

// MARK: - Public
extension PackListViewModel {

    func fetchAndPersistPacks(refreshing: Bool = false) async {

        Task { [weak self] in

            guard let self else { return }

            if refreshing == false {
                
                self.currentState.send(.loading)
            }

            do {
                
                let packs = try await self.provider.fetchPacks()
                self.savePacks(packs)
                
            } catch {
                
                self.currentState.send(.error(error))
            }
        }
    }
    
    func retrievePacks() async {
        
        do {
            
            let packs = try self.persistanceProvider.fetchPacks()
            
            packs.forEach { pack in
                
                print(pack.id)
                print(pack.isArchived)
            }
            
            self.packs = self.groupPacks(packs.filter { $0.isArchived ?? false == false })
            self.currentState.send(.loaded)

        } catch {
            
            self.currentState.send(.error(error))
        }
    }
    
    func archive(_ pack: Pack, indexPath: IndexPath) {
        
        do {
            
            try self.persistanceProvider.archivePack(pack)
            self.currentState.send(.archiveCompleted(indexPath))
            
        } catch {
            
            self.currentState.send(.error(error))
        }
    }
}

// MARK: - Helpers
private extension PackListViewModel {
    
    func savePacks(_ packs: [Pack]) {
        
        packs.forEach { pack in
            
            do {
                
                try self.persistanceProvider.savePack(pack)
                
            } catch {
                
                print(error)
            }
        }
    }
 
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
