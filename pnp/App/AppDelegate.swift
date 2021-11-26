//
//  AppDelegate.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        let navigationController = UINavigationController()
        let controller: ViewController = .instantiate()
        navigationController.setViewControllers([controller], animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

