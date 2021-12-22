//
//  ClassifiedAdEnricher.swift
//  Annonces_Entities
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdEnricher {
    
    func enrich(classifiedAds: [ClassifiedAd], withAdCategories adCategories: [AdCategory]) -> [EnrichedClassifiedAd] {
        var enrichedClassifiedAds = [EnrichedClassifiedAd]()
        
        classifiedAds.forEach { classifiedAd in
            if let matchingAdCategory = adCategories.first(where: { $0.id == classifiedAd.categoryId }) {
                let enrichedClassifiedAd = EnrichedClassifiedAd(from: classifiedAd, andCategory: matchingAdCategory)
                enrichedClassifiedAds.append(enrichedClassifiedAd)
            }
        }
        
        return enrichedClassifiedAds
    }
}
