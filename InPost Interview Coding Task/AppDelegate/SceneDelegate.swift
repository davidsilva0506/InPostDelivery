//
//  SceneDelegate.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit
import RealmSwift

private enum Constants {
    
    static let storyboard = "Main"
    static let root = "PackListViewController"
    static let serviceName = "JSON Serve API"
    static let baseURL = "https://api.jsonserve.com"
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var core: Core?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if ProcessInfo.processInfo.arguments.contains(AppConstants.automationLaunchArgument) {
            
            self.setupAutomationEnvironment(scene: scene)

        } else {
            
            self.setupCore()

            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            
            guard let window = self.window else { return }

            window.windowScene = windowScene
            window.rootViewController = self.rootViewController()
            window.makeKeyAndVisible()
        }
    }
}

extension SceneDelegate {
    
    private func setupCore() {
        
        let config = NetworkConfig(name: Constants.serviceName,
                                   baseURL: Constants.baseURL)

        let network = NetworkLayer(networkConfig: config)
        let service = ServiceLayer(network: network)
        let persistance = PersistanceLayer()
        let persistanceService = PersistanceServiceLayer(persistance: persistance)
            
        self.core = Core(network: network,
                         service: service,
                         persistance: persistance,
                         persistanceService: persistanceService)
    }
    
    private func rootViewController() -> UINavigationController {
        
        guard let core else {
            
            assertionFailure("We should have core at this stage")
            return UINavigationController()
        }
        
        let packListViewModel = PackListViewModel(provider: core.service, persistanceProvider: core.persistanceService)
        let packListViewController = PackListViewController(viewModel: packListViewModel)
        
        return IPNavigationController(rootViewController: packListViewController)
    }
}
