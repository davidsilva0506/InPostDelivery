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
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()
    
    private lazy var emptyView: EmptyView = {
       
        let emptyView = EmptyView()
        
        emptyView.isHidden = true
        
        return emptyView
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
        
        Task {
         
            await self.viewModel.fetchAndPersistPacks()
        }
    }
    
    @objc private func refresh(_ sender: Any) {

        Task {

            await self.viewModel.fetchAndPersistPacks(refreshing: true)
        }
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
        
        self.view.add(self.tableView, self.emptyView)
    }
    
    func configureSubviews() {
        
        self.tableView.register(PackTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        self.tableView.addSubview(self.refreshControl)
        
        self.emptyView.configure(title: "ai meu deus os packs???", message: "olha, foram à vida deles")
    }
    
    func defineSubviewConstraints() {

        self.emptyView.pin(to: self.view)
        self.tableView.pin(to: self.view)
    }
    
    func configureUI(for state: PackState) {

        switch state {

        case .loading:

            self.showActivityOverlay()
            
        case .loaded:
             
            self.emptyView.isHidden = true
            self.tableView.isHidden = false
            self.hideActivityOverlay()
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
            
        case .empty:
            
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
            self.hideActivityOverlay()
            self.refreshControl.endRefreshing()
            
        case .archiveCompleted(let indexPath):

            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        case .error(let error):
    
            self.hideActivityOverlay()
            self.refreshControl.endRefreshing()
            self.handleError(error)
        }
    }
    
    func handleError(_ error: Error) {
        
    }
}

// MARK: - UITableViewDelegate
extension PackListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
    
        return "Archive"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let packs = self.viewModel.packs[safe: indexPath.section],
                let pack = packs[safe: indexPath.row] else {

            assertionFailure("IndexPath out of bounds")
            return
        }
        
        if editingStyle == .delete {
                
            self.viewModel.archive(pack, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 0).cgPath
    }
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = SectionHeaderView()
        let title = PackListViewControllerSection(rawValue: section)?.headerTitle() ?? ""
        view.configure(title: title)
        
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        switch section {
            case 0:
                return self.viewModel.packs[safe: section]?.count ?? 0 > 0 ? UITableView.automaticDimension : 0
            case 1:
                return self.viewModel.packs[safe: section]?.count ?? 0 > 0 ? UITableView.automaticDimension : 0
            default:
                return 0
        }
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

        cell.selectionStyle = .none
        cell.configure(pack: pack, for: indexPath)
        
        return cell
    }
}
