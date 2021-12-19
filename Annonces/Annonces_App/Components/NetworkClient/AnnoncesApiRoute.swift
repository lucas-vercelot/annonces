//
//  AnnoncesApiRoute.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation

class AnnoncesApiRoute {
    
    private let action: AnnoncesApiAction
    
    required init(action: AnnoncesApiAction) {
        self.action = action
    }
    
    enum HTTPMethod: String {
        case get
    }
    
    var method: HTTPMethod {
        switch action {
        case .classifiedAds, .adCategories:
            return .get
        }
    }
    
    var endpoint: String? {
        switch action {
        case .adCategories:
            return "categories.json"
        case .classifiedAds:
            return "listing.json"
        }
    }
    
    var responseTimeout: TimeInterval {
        return 5.0
    }
}
