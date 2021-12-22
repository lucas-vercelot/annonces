//
//  ClassifiedAdFilterer.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdFilterer {
    
    func filter(enrichedClassifiedAds: [EnrichedClassifiedAd], for category: AdCategory) -> [EnrichedClassifiedAd] {
        return enrichedClassifiedAds.filter { $0.category.id == category.id }
    }
}
