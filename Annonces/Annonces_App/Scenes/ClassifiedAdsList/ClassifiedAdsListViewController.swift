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
    
    private lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = .systemBackground
        navigationBar.barTintColor = .systemBackground
        let navigationItem = UINavigationItem(title: "Annonces")
        navigationItem.titleView?.backgroundColor = .systemBackground
        navigationBar.setItems([navigationItem], animated: false)
        let filterAction = UIAction() { [weak self] action in
            self?.showFilterOptions()
        }
        let filterButton = UIBarButtonItem(title: "Filtrer", image: nil, primaryAction: filterAction, menu: nil)
        navigationItem.rightBarButtonItem = filterButton
        return navigationBar
    }()
    
    private lazy var tableView : UITableView = {
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
        
        configureViews()
        configureTableView()
        
        interactor.load()
    }
    
    // MARK: - Configure
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)),
            navigationBar.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureTableView() {
        tableViewDelegate = ClassifiedAdsTableViewDelegate(tableView: tableView)
        tableView.delegate = tableViewDelegate
        
        tableViewDelegate?.didSelectClassifiedAdAtIndex = { [weak self] indexPath in
            guard let enrichedClassifiedAd = self?.viewModel?.enrichedClassifiedAds[indexPath.row] else { return }
            self?.internalRouter.showClassifiedAdDetail(for: enrichedClassifiedAd)
        }
        
        tableViewDataSource = ClassifiedAdsTableViewDataSource(tableView: tableView, dataProvider: self)
        tableView.dataSource = tableViewDataSource
    }
    
    // MARK: - Filter
    
    private func showFilterOptions() {
        let alert = UIAlertController(title: "Filtrer par Catégorie",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        let currentAction = UIAlertAction(title: "Annuler",
                                          style: .cancel,
                                          handler: nil)
        alert.addAction(currentAction)
        
        let resetFilterAction = UIAlertAction(title: "Toutes les Catégories",
                                              style: .default) { [weak self] _ in
            self?.interactor.loadClassifiedAdsForCategory(adCategory: nil)
        }
        alert.addAction(resetFilterAction)
        
        viewModel?.adCategories.forEach { adCategory in
            let action = UIAlertAction(title: adCategory.name,
                                       style: .default) { [weak self] _ in
                self?.interactor.loadClassifiedAdsForCategory(adCategory: adCategory)
            }
            alert.addAction(action)
        }
        
        alert.popoverPresentationController?.sourceView = navigationBar
        alert.popoverPresentationController?.sourceRect = navigationBar.bounds
        
        present(alert, animated: true, completion: nil)
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
