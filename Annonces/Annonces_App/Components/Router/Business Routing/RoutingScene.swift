//
//  RoutingScene.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation

extension Routing {
    
    /// Describe all scenes of the applications, and their required parameters.
    enum Scene: Equatable {

        case classifiedAdsList
        
        var shouldBeEmbeddedInNavigationStackAsRoot: Bool {
            switch self {
            case .classifiedAdsList:
                return true
            }
        }
    }
}
