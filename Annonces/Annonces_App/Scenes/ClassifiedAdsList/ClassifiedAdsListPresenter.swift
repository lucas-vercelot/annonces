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
    
    init(displayer: ClassifiedAdsListDisplayable,
         classifiedAdEnricher: ClassifiedAdEnricher = ClassifiedAdEnricher()) {
        self.displayer = displayer
        self.classifiedAdEnricher = classifiedAdEnricher
    }
}

// MARK: - Interactor -> Presenter

extension ClassifiedAdsListPresenter: ClassifiedAdsListPresentable {
    
    func presentClassifiedAds(with response: ClassifiedAdsListModels.Response) {
        let enrichedClassifiedAds = classifiedAdEnricher.enrich(classifiedAds: response.classifiedAds, withAdCategories: response.adCategories)
        displayer?.displayClassifiedAds(with: ClassifiedAdsListModels.ViewModel(enrichedClassifiedAds: enrichedClassifiedAds))
    }
}
