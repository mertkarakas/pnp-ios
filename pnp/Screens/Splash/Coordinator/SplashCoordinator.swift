//
//  SplashCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
    func goToPreLogin()
}

final class SplashCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let splashViewModel = SplashViewModel()
        splashViewModel.coordinatorDelegate = self

        let splashViewController: SplashViewController = .instantiate()
        splashViewController.viewModel = splashViewModel
        splashViewController.navigationItem.removeBackBarButtonTitle()

        navigationController.setViewControllers([splashViewController], animated: false)
    }
}

extension SplashCoordinator: SplashCoordinatorDelegate {
    func goToPreLogin() {
        let preloginCoordinator = PreLoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(preloginCoordinator)
        preloginCoordinator.start()
    }
}
