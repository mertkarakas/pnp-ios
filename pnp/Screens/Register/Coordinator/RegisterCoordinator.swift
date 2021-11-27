//
//  RegisterCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol RegisterCoordinatorDelegate: AnyObject {
    func goToDashboard(with user: User)
}

final class RegisterCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let registerViewModel = RegisterViewModel(coreDataManager: dependency.coreDataManager)
        registerViewModel.coordinatorDelegate = self
        let registerVC: RegisterViewController = .instantiate()
        registerVC.viewModel = registerViewModel
        registerVC.navigationItem.removeBackBarButtonTitle()
        navigationController.show(registerVC, sender: nil)
    }
}

extension RegisterCoordinator: RegisterCoordinatorDelegate {
    func goToDashboard(with user: User) {
        let dashboardCoordinator = DashboardCoordinator(
            navController: navigationController,
            dependency: dependency,
            user: user
        )
        childCoordinators.append(dashboardCoordinator)
        dashboardCoordinator.start()
    }
}
