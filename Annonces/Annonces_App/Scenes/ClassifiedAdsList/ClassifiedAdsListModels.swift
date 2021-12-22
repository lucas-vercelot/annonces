//
//  ClassifiedAdsListModels.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

enum ClassifiedAdsListModels {
    
    // MARK: - Interactor -> Presenter
    
    struct Response {
        let adCategories: [AdCategory]
        let classifiedAds: [ClassifiedAd]
    }
    
    // MARK: - Presenter -> ViewController
    
    struct ViewModel {
        let adCategories: [AdCategory]
        let enrichedClassifiedAds: [EnrichedClassifiedAd]
    }
}
