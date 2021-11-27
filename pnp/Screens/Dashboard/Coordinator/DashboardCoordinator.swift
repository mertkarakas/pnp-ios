//
//  DashboardCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol DashboardCoordinatorDelegate: AnyObject {
    func goToNewCampaign()
}

final class DashboardCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController

    init(navController: UINavigationController) {
        self.navigationController = navController
    }

    func start() {
        let tabBarController = UITabBarController()
        let campaignViewModel = CampaignViewModel()
        let tabBar = UITabBarItem(title: GeneralConstants.campaigns, image: UIImage(systemName: "newspaper.fill"), tag: 0)
        campaignViewModel.coordinatorDelegate = self
        let campaignViewController: CampaignViewController = .instantiate()
        campaignViewController.tabBarItem = tabBar
        campaignViewController.viewModel = campaignViewModel
        campaignViewController.navigationItem.removeBackBarButtonTitle()

        let dashboardViewModel = DashboardViewModel()
        dashboardViewModel.coordinatorDelegate = self
        let dashboardViewController: DashboardViewController = .instantiate()
        dashboardViewController.viewModel = dashboardViewModel
        dashboardViewController.navigationItem.removeBackBarButtonTitle()
        let profile: ProfileViewController = .instantiate()
        tabBarController.setViewControllers([dashboardViewController, campaignViewController, profile], animated: false)

        navigationController.setViewControllers([tabBarController], animated: false)
    }
}

extension DashboardCoordinator: DashboardCoordinatorDelegate {
    func goToNewCampaign() {
        let coordinator = NewCampaignCoordinator(navController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension DashboardCoordinator: CampaignCoordinatorDelegate {
    func goToDetail(with item: CampaignModel) {

    }

    func goToSignIn() {
    }
}
