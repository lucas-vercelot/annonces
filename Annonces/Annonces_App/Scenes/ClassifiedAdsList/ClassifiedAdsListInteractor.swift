//
//  ClassifiedAdsListInteractor.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdsListInteractor {
    
    // MARK: - Vars
    
    private let presenter: ClassifiedAdsListPresentable
    private let networkClient: NetworkClient
    
    // MARK: - Init
    
    init(presenter: ClassifiedAdsListPresentable,
         networkClient: NetworkClient = NetworkClientImpl.shared) {
        self.presenter = presenter
        self.networkClient = networkClient
    }
}

// MARK: - ViewController -> Interactor

extension ClassifiedAdsListInteractor: ClassifiedAdsListInteractable {
    
    func loadClassifiedAds() {
        networkClient.fetchAdsAndCategories { [weak self] categoriesAndClassifiedAds in
            self?.presenter.presentClassifiedAds(with: ClassifiedAdsListModels.Response(adCategories: categoriesAndClassifiedAds.0, classifiedAds: categoriesAndClassifiedAds.1))
        }
    }
}
