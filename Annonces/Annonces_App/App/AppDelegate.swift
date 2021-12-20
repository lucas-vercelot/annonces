//
//  AppDelegate.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 17/12/2021.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appRouter = AppRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        appRouter.setupMainWindow()
        appRouter.presentMain()
        
        return true
    }
}
