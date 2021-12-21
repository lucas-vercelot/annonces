//
//  ClassifiedAdsListRouter.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import UIKit
import Annonces_Entities

class ClassifiedAdsListRouter: ViewControllerRouter {}

// MARK: - ViewController -> Router

extension ClassifiedAdsListRouter: ClassifiedAdsListRoutable {
    
    func showClassifiedAdDetail(for enrichedClassifiedAd: EnrichedClassifiedAd) {
        present(scene: .classifiedAdDetail(enrichedClassifiedAd: enrichedClassifiedAd))
    }
}
