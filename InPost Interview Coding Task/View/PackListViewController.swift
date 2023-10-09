//
//  PackListViewController.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit

private enum Constants {

    static let title = "Lista przesyłek"
    static let cellIdentifier = "PackTableViewCell"
}

class PackListViewController: UIViewController {
    
    private let packNetworking = PackNetworking()
    
    private let tableView = UITableView()
    private var packs: [Pack] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.title
        
        self.addSubviews()
        self.configureSubviews()
        self.defineSubviewConstraints()
        
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
            
            //self.removePacks()
            
            if let packs {
                
                self.packs = packs
                
                self.tableView.reloadData()
              //  _ = packs.map { self.addPackView($0) }
            }
            
        } catch {
            
            print(error)
        }
    }
    
    private func removePacks() {
        
//        self.stackView.arrangedSubviews.forEach { subview in
//
//            subview.removeFromSuperview()
//        }
    }
    
    private func addPackView(_ pack: Pack) {
        
//        let packView = PackView()
//        packView.setup(pack: pack)
//
//        self.stackView.addArrangedSubview(packView)
    }
}

// MARK: - View Configuration
private extension PackListViewController {
    
    func addSubviews() {
        
        self.view.addSubview(self.tableView)
    }
    
    func configureSubviews() {
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(PackTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }
    
    func defineSubviewConstraints() {

        self.tableView.pin(to: self.view)
    }
}

// MARK: - UITableViewDelegate
extension PackListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension PackListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.packs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? PackTableViewCell else {
            
            return UITableViewCell()
        }
        
        let pack = self.packs[indexPath.row]
        cell.configure(pack: pack)
        
        return cell
    }
}
