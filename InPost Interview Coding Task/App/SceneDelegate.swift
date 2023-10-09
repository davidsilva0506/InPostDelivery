//
//  SceneDelegate.swift
//  InPost Interview Coding Task
//
//  Created by David Silva on 09/10/2023.
//

import UIKit

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
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        guard let window = self.window else { return }
        
        window.windowScene = windowScene
        window.rootViewController = IPNavigationController(rootViewController: PackListViewController())
        window.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    
    private func setupCore() {
        
        let config = NetworkConfig(name: Constants.serviceName,
                                   baseURL: Constants.baseURL)

        let network = NetworkLayer(networkConfig: config)
        
        let service = ServiceLayer(network: network)
        
        self.core = Core(network: network, service: service)
    }
}
