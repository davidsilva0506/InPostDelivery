//
//  ViewController.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

private enum Constants {

    static let title = "Lista przesyłek"
}

class PackListController: UIViewController {

    @IBOutlet private var stackView: UIStackView!
    
    private let packNetworking = PackNetworking()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.title
        
        Task {
            
            await self.fetchPacks()
        }
    }
    
    private func fetchPacks() async {
        
        let config = NetworkConfig(name: "JSON Serve API", baseURL: "https://api.jsonserve.com")
        let network = NetworkLayer(networkConfig: config)
        let service = ServiceLayer(network: network)
            
        do {
            
            let packs = try await service.fetchPacks()
            
            self.removePacks()
            
            if let packs {
                
                _ = packs.map { self.addPackView($0) }
            }
            
        } catch {
            
            print(error)
        }
    }
    
    private func removePacks() {
        
        self.stackView.arrangedSubviews.forEach { subview in
            
            subview.removeFromSuperview()
        }
    }
    
    private func addPackView(_ pack: Pack) {
        
        let packView = PackView()
        packView.setup(pack: pack)
        
        self.stackView.addArrangedSubview(packView)
    }
}
