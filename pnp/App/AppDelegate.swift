//
//  AppDelegate.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit
import Service
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UITabBar.appearance().tintColor = .primary

        let window = UIWindow()
        self.window = window

        let serviceManager = ServiceManager()
        let coreDataManager = CoreDataManager()

        let dependency = DependencyContainer(window: window, serviceManager: serviceManager, coreDataManager: coreDataManager)
        appCoordinator = AppCoordinator(dependency: dependency)
        appCoordinator?.start()

        return true
    }
}

