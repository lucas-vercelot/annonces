//
//  AppRouter.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 19/12/2021.
//

import Foundation
import UIKit

class AppRouter: BaseRouter {
    
    private lazy var mainWindow: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    override init() {
        super.init()
    }

    override func execute(step: Routing.Step) -> Bool {
        switch step {
        case .push, .present:
            return false
        }
    }

    // MARK: - Main Window setup

    func setupMainWindow() {
        mainWindow.makeKeyAndVisible()
    }
}

// MARK: - Main Window

extension AppRouter {

    func presentMain() {
        let viewController = Routing.Scene.classifiedAdsList.asViewController()
        currentChild = viewController.router
        mainWindow.rootViewController = viewController
    }
}
