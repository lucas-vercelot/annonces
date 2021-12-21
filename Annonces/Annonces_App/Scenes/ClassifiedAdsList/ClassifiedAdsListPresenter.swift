//
//  ClassifiedAdsListPresenter.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdsListPresenter {
    
    private weak var displayer: ClassifiedAdsListDisplayable?
    private let classifiedAdEnricher: ClassifiedAdEnricher
    private let classifiedAdFilterer: ClassifiedAdFilterer
    private let classifiedAdOrderer: ClassifiedAdOrderer
    
    init(displayer: ClassifiedAdsListDisplayable,
         classifiedAdEnricher: ClassifiedAdEnricher = ClassifiedAdEnricher(),
         classifiedAdFilterer: ClassifiedAdFilterer = ClassifiedAdFilterer(),
         classifiedAdOrderer: ClassifiedAdOrderer = ClassifiedAdOrderer()) {
        self.displayer = displayer
        self.classifiedAdEnricher = classifiedAdEnricher
        self.classifiedAdFilterer = classifiedAdFilterer
        self.classifiedAdOrderer = classifiedAdOrderer
    }
}

// MARK: - Interactor -> Presenter

extension ClassifiedAdsListPresenter: ClassifiedAdsListPresentable {
    func presentClassifiedAds(with response: ClassifiedAdsListModels.Response, filteredFor adCategory: AdCategory?) {
        let enrichedClassifiedAds = classifiedAdEnricher.enrich(classifiedAds: response.classifiedAds, withAdCategories: response.adCategories)
        var filteredEnrichedClassifiedAds = enrichedClassifiedAds
        
        if let adCategory = adCategory {
            filteredEnrichedClassifiedAds = classifiedAdFilterer.filter(enrichedClassifiedAds: enrichedClassifiedAds,
                                                                        for: adCategory)
        }
        
        let orderedEnrichedClassifiedAds = classifiedAdOrderer.orderByDateAndUrgent(enrichedClassifiedAds: filteredEnrichedClassifiedAds)
        
        displayer?.displayClassifiedAds(with: ClassifiedAdsListModels.ViewModel(adCategories: response.adCategories, enrichedClassifiedAds: orderedEnrichedClassifiedAds))
    }
}
