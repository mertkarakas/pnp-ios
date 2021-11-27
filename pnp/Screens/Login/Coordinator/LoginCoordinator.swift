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
    let navigationController: UINavigationController

    init(navController: UINavigationController) {
        self.navigationController = navController
    }

    func start() {
        let loginViewModel = LoginViewModel()
        loginViewModel.loginCoordinator = self
        let loginViewController: LoginViewController = .instantiate()
        loginViewController.viewModel = loginViewModel
        loginViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.show(loginViewController, sender: nil)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func goToDashboard() {
        let dashboardCoordinator = DashboardCoordinator(navController: navigationController)
        childCoordinators.append(dashboardCoordinator)
        dashboardCoordinator.start()
    }
}
