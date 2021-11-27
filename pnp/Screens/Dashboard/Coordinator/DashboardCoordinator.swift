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
    private let dependency: DependencyContainer
    private let user: User
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer, user: User) {
        self.navigationController = navController
        self.dependency = dependency
        self.user = user
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


        let profileViewModel = ProfileViewModel()
        profileViewModel.coordinatorDelegate = self

        let profile: ProfileViewController = .instantiate()
        profile.viewModel = profileViewModel

        tabBarController.setViewControllers([dashboardViewController, campaignViewController, profile], animated: false)

        navigationController.setViewControllers([tabBarController], animated: false)
    }
}

extension DashboardCoordinator: DashboardCoordinatorDelegate {
    func goToNewCampaign() {
        let coordinator = NewCampaignCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension DashboardCoordinator: CampaignCoordinatorDelegate {
    func goToDetail(with item: CampaignModel) {
        let campaignDetailViewModel = CampaignDetailViewModel(item: item)
        let campaignDetailViewController: CampaignDetailViewController = .instantiate()
        campaignDetailViewController.viewModel = campaignDetailViewModel

        navigationController.present(campaignDetailViewController, animated: true, completion: nil)
    }

    func goToSignIn() {
    }
}

extension DashboardCoordinator: ProfileCoordinatorDelegate {
    func logout() {
        let preloginCoordinator = PreLoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(preloginCoordinator)
        preloginCoordinator.start()
    }
}
