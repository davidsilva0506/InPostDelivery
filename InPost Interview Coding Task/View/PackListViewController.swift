//
//  PackListViewController.swift
//  InPost Interview Coding Task
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import UIKit
import Combine

class PackListViewController: UIViewController {
    
    // MARK: Constants
    private enum Constants {

        static let title = "Lista przesyłek"
        static let cellIdentifier = "PackTableViewCell"
    }

    // MARK: - Properties
    private let viewModel: PackListViewModel

    private var observers = Set<AnyCancellable>()
    
    private lazy var refreshControl: UIRefreshControl = {
    
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

        return refreshControl
    }()
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
    
    // MARK: - Lifecycle
    init(viewModel: PackListViewModel) {

        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = Constants.title
        
        self.addSubviews()
        self.configureSubviews()
        self.defineSubviewConstraints()
        
        self.bindToViewModel()
        
        self.viewModel.fetchPacks()
    }
    
    @objc private func refresh(_ sender: Any) {
        
        self.viewModel.fetchPacks(refreshing: true)
    }
}

// MARK: - Bind
private extension PackListViewController {
    
    func bindToViewModel() {
        
        self.viewModel.currentState.receive(on: DispatchQueue.main).sink { state in
            
            self.configureUI(for: state)
            
        }.store(in: &self.observers)
    }
}

// MARK: - View Configuration
private extension PackListViewController {
    
    func addSubviews() {
        
        self.view.addSubview(self.tableView)
    }
    
    func configureSubviews() {
        
        self.tableView.register(PackTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        self.tableView.addSubview(self.refreshControl)
    }
    
    func defineSubviewConstraints() {

        self.tableView.pin(to: self.view)
    }
    
    func configureUI(for state: PackState) {

        switch state {

        case .loaded:
             
            self.hideActivityOverlay()
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()

        case .error(let error):
    
            self.hideActivityOverlay()
            self.refreshControl.endRefreshing()
            self.handleError(error)

        case .loading:

            self.showActivityOverlay()
        }
    }
    
    func handleError(_ error: Error) {
        
    }
}

// MARK: - UITableViewDelegate
extension PackListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension PackListViewController: UITableViewDataSource {
    
    enum PackListViewControllerSection: Int {

        case ready = 0
        case other = 1

        func headerTitle() -> String? {

            switch self {
                case .ready: return "Gotowe do odbioru"
                case .other: return "Pozostale"
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.viewModel.packs.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return PackListViewControllerSection(rawValue: section)?.headerTitle()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let packs = self.viewModel.packs[safe: section] else {

            assertionFailure("IndexPath out of bounds")
            return 0
        }

        return packs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let packs = self.viewModel.packs[safe: indexPath.section],
                let pack = packs[safe: indexPath.row] else {

            assertionFailure("IndexPath out of bounds")
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as? PackTableViewCell else {
            
            return UITableViewCell()
        }

        cell.configure(pack: pack)
        
        return cell
    }
}
