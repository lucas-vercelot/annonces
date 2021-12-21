//
//  RoutingScene.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import Annonces_Entities

extension Routing {
    
    /// Describes all scenes (mostly view controllers) of the application, and their required parameters if any.
    enum Scene: Equatable {

        case classifiedAdsList
        case classifiedAdDetail(enrichedClassifiedAd: EnrichedClassifiedAd)
    }
}
