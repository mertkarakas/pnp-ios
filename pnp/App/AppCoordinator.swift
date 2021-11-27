//
//  AppCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get }
    func start()
}

final class AppCoordinator: CoordinatorProtocol {

    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependencyContainer: DependencyContainer

    init(dependency: DependencyContainer) {
        self.dependencyContainer = dependency
    }

    func start() {
        let navigationController = UINavigationController()

        let splashCoordinator = SplashCoordinator(navController: navigationController)
        childCoordinators.append(splashCoordinator)
        splashCoordinator.start()

        let window = dependencyContainer.window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func didFinishChild(_ coordinator: CoordinatorProtocol) {
        if let index = childCoordinators.firstIndex(where: {$0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
}
