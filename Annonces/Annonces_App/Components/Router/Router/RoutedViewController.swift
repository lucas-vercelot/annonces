//
//  RoutedViewController.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import UIKit
import Foundation

protocol RoutedViewController where Self: UIViewController {
    var router: Router? { get }
}
