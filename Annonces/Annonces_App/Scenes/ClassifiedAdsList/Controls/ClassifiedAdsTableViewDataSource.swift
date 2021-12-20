//
//  ClassifiedAdsTableViewDataSource.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import UIKit
import Annonces_Entities

protocol ClassifiedAdsTableViewDataProvider: AnyObject {
    func getData() -> [EnrichedClassifiedAd]
}

class ClassifiedAdsTableViewDataSource: NSObject {
    
    // MARK: - Vars
    
    private weak var tableView: UITableView?
    private weak var dataProvider: ClassifiedAdsTableViewDataProvider?

    // MARK: - Init
    
    init(tableView: UITableView,
         dataProvider: ClassifiedAdsTableViewDataProvider) {
        self.tableView = tableView
        self.dataProvider = dataProvider
        super.init()
        tableView.dataSource = self
        registerCells()
    }
 
    // MARK: - Configure
    
    private func registerCells() {
        tableView?.register(ClassifiedAdTableViewCell.self, forCellReuseIdentifier: "ClassifiedAdTableViewCell")
    }
}

// MARK: - UITableViewDataSource

extension ClassifiedAdsTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider?.getData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let enrichedClassifiedAd = dataProvider?.getData()[indexPath.row] else {
            return defaultCell()
        }
        
        return classifiedAdCell(with: enrichedClassifiedAd, at: indexPath)
    }
    
    private func classifiedAdCell(with enrichedClassifiedAd: EnrichedClassifiedAd, at indexPath: IndexPath) -> UITableViewCell {
        guard let classifiedAdCell = tableView?.dequeueReusableCell(withIdentifier: "ClassifiedAdTableViewCell", for: indexPath) as? ClassifiedAdTableViewCell else {
            fatalError("Unable to create cell ClassifiedAdTableViewCell")
        }
        
        classifiedAdCell.configure(with: enrichedClassifiedAd)
        
        return classifiedAdCell
    }
    
    private func defaultCell(title: String? = nil) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .brown
        cell.textLabel?.text = title
        return cell
    }
}
