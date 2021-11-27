//
//  LoginCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func goToDashboard()
}

final class LoginCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let loginViewModel = LoginViewModel(coreDataManager: dependency.coreDataManager)
        loginViewModel.loginCoordinator = self
        let loginViewController: LoginViewController = .instantiate()
        loginViewController.viewModel = loginViewModel
        loginViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.show(loginViewController, sender: nil)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func goToDashboard() {
        let dashboardCoordinator = DashboardCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(dashboardCoordinator)
        dashboardCoordinator.start()
    }
}
