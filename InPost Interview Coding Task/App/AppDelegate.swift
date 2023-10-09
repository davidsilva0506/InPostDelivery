//
//  AppDelegate.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

private enum Constants {
    
    static let storyboard = "Main"
    static let root = "PackListViewController"
    static let serviceName = "JSON Serve API"
    static let baseURL = "https://api.jsonserve.com"
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var core: Core?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.setupCore()
        self.buildStartingView()
        
        return true
    }

    private func setupCore() {
        
        let config = NetworkConfig(name: Constants.serviceName,
                                   baseURL: Constants.baseURL)

        let network = NetworkLayer(networkConfig: config)
        
        let service = ServiceLayer(network: network)
        
        self.core = Core(network: network, service: service)
    }

    private func buildStartingView() {
        
        let storyboard = UIStoryboard(name: Constants.storyboard, bundle: nil)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window,
              let packListViewController = storyboard.instantiateViewController(withIdentifier: Constants.root) as? PackListViewController else { return }
        
        window.rootViewController = IPNavigationController(rootViewController: packListViewController)
        window.makeKeyAndVisible()
    }
}
