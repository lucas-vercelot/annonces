//
//  ClassifiedAdsListViewController.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import UIKit
import Annonces_Entities

class ClassifiedAdsListViewController: UIViewController {
    
    // MARK: - Outlets
    
    private var tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: - Dependencies
    
    private lazy var interactor: ClassifiedAdsListInteractable = ClassifiedAdsListInteractor(presenter: ClassifiedAdsListPresenter(displayer: self))
    private lazy var internalRouter: ClassifiedAdsListRoutable & Router = ClassifiedAdsListRouter(viewController: self)
    private var viewModel: ClassifiedAdsListModels.ViewModel?
    
    // MARK: - Vars
    
    private var tableViewDataSource: ClassifiedAdsTableViewDataSource?
    private var tableViewDelegate: ClassifiedAdsTableViewDelegate?
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        configureTableView()
        
        interactor.loadClassifiedAds()
    }
    
    // MARK: - Configure
    
    private func configureTableView() {
        tableViewDelegate = ClassifiedAdsTableViewDelegate(tableView: tableView)
        tableView.delegate = tableViewDelegate
        
        tableViewDataSource = ClassifiedAdsTableViewDataSource(tableView: tableView, dataProvider: self)
        tableView.dataSource = tableViewDataSource
    }
}

// MARK: - Presenter -> ViewController

extension ClassifiedAdsListViewController: ClassifiedAdsListDisplayable {
    
    func displayClassifiedAds(with viewModel: ClassifiedAdsListModels.ViewModel) {
        self.viewModel = viewModel
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - ViewController -> Router

extension ClassifiedAdsListViewController {}

extension ClassifiedAdsListViewController: RoutedViewController {
    var router: Router? {
        return internalRouter
    }
}

// MARK: - DataProvider -> TableView DataSource & Delegate

extension ClassifiedAdsListViewController: ClassifiedAdsTableViewDataProvider {

    func getData() -> [EnrichedClassifiedAd] {
        return viewModel?.enrichedClassifiedAds ?? []
    }
}
