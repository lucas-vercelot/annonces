//
//  ClassifiedAdsListInteractor.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdsListInteractor {
    
    // MARK: - Dependencies
    
    private let presenter: ClassifiedAdsListPresentable
    private let networkClient: NetworkClient

    // MARK: - Vars
    
    private var adCategories = [AdCategory]()
    private var classifiedAds = [ClassifiedAd]()
    
    // MARK: - Init
    
    init(presenter: ClassifiedAdsListPresentable,
         networkClient: NetworkClient = NetworkClientImpl.shared) {
        self.presenter = presenter
        self.networkClient = networkClient
    }
}

// MARK: - ViewController -> Interactor

extension ClassifiedAdsListInteractor: ClassifiedAdsListInteractable {
    
    func load() {
        loadClassifiedAds()
    }
    
    func loadClassifiedAdsForCategory(adCategory: AdCategory?) {
        if classifiedAds.isEmpty == false && adCategories.isEmpty == false {
            presenter.presentClassifiedAds(
                with: ClassifiedAdsListModels.Response(adCategories: adCategories,
                                                       classifiedAds: classifiedAds),
                filteredFor: adCategory)
        } else {
            loadClassifiedAds(filteredFor: adCategory)
        }
    }
    
    private func loadClassifiedAds(filteredFor adCategory: AdCategory? = nil) {
        networkClient.fetchAdCategoriesAndClassifiedAds { [weak self] categoriesAndClassifiedAds in
            guard let self = self else { return }
            
            self.adCategories = categoriesAndClassifiedAds.adCategories
            self.classifiedAds = categoriesAndClassifiedAds.classifiedAds
            self.presenter.presentClassifiedAds(
                with: ClassifiedAdsListModels.Response(adCategories: self.adCategories,
                                                       classifiedAds: self.classifiedAds),
                filteredFor: adCategory)
        }
    }
}
