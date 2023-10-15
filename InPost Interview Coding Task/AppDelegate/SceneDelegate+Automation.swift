//
//  SceneDelegate+Automation.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 15/10/2023.
//

import Foundation
import UIKit

extension SceneDelegate {
    
    func setupAutomationEnvironment(scene: UIScene) {
        
        self.setupMockedCore()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        guard let window = self.window,
              let core = self.core else {
            
            return
        }
        
        let mockedViewModel = PackListViewModel(provider: core.service, persistanceProvider: core.persistanceService)
        let packListViewController = PackListViewController(viewModel: mockedViewModel)
        let rootViewController = IPNavigationController(rootViewController: packListViewController)

        window.windowScene = windowScene
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    private func setupMockedCore() {
        
        let config = NetworkConfig(name: "Automation",
                                   baseURL: "")

        let network = NetworkLayer(networkConfig: config)
        let service = PackProviderMock(network: network)
        let persistance = PersistanceLayer()
        let persistanceService = PackPersistanceProviderMock(persistance: persistance)
            
        self.core = Core(network: network,
                         service: service,
                         persistance: persistance,
                         persistanceService: persistanceService)
    }
}
