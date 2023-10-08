//
//  AppDelegate.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

private enum Constants {
    
    static let storyboard = "Main"
    static let root = "PackListController"
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.buildStartingView()
        
        return true
    }

    private func buildStartingView() {
        
        let storyboard = UIStoryboard(name: Constants.storyboard, bundle: nil)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window,
              let packListController = storyboard.instantiateViewController(withIdentifier: Constants.root) as? PackListController else { return }
        
        window.rootViewController = IPNavigationController(rootViewController: packListController)
        window.makeKeyAndVisible()
    }
}
