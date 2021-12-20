//
//  RoutingScene+UIViewController.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import UIKit

extension Routing.Scene {
    
    /// Instanciate the correspondong ViewController of the scene.
    func asViewController() -> UIViewController & RoutedViewController {
        switch self {
        case .classifiedAdsList:
            return ClassifiedAdsListViewController()
        }
    }
}
