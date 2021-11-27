//
//  DashboardCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol DashboardCoordinatorDelegate: AnyObject {

}

final class DashboardCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController

    init(navController: UINavigationController) {
        self.navigationController = navController
    }

    func start() {
        let tabBarController = UITabBarController()
        let dashboardViewModel = DashboardViewModel()
        dashboardViewModel.coordinatorDelegate = self
        let dashboardViewController: DashboardViewController = .instantiate()
        dashboardViewController.viewModel = dashboardViewModel
        dashboardViewController.navigationItem.removeBackBarButtonTitle()
        let profile: ProfileViewController = .instantiate()
        tabBarController.setViewControllers([dashboardViewController, profile], animated: false)
        navigationController.setViewControllers([tabBarController], animated: false)
    }
}

extension DashboardCoordinator: DashboardCoordinatorDelegate {

}
