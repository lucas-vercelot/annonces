//
//  ClassifiedAdOrderer.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation
import Annonces_Entities

class ClassifiedAdOrderer {
    
    func orderByDateAndUrgent(enrichedClassifiedAds: [EnrichedClassifiedAd]) -> [EnrichedClassifiedAd] {
        return enrichedClassifiedAds.sorted()
    }
}
