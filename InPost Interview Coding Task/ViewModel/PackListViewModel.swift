//
//  PackListViewModel.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 11/10/2023.
//

import Foundation
import Combine

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

    private(set) var currentState = PassthroughSubject<PackState, Never>()
    private(set) var packs: [[Pack]] = []

    init(provider: PackProvider) {

        self.provider = provider
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
        
        return packs.chunked(into: 4)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
