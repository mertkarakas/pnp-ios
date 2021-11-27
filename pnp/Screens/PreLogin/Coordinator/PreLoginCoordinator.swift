//
//  PreLoginCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol PreLoginCoordinatorDelegate: AnyObject {
    func goToCampaigns()
    func goToSignIn()
}

final class PreLoginCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private var navigationController: UINavigationController
    private var dependency: DependencyContainer
    var parentCoordinator: AppCoordinator?

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let preLoginViewModel = PreLoginViewModel()
        preLoginViewModel.coordinatorDelegate = self

        let preloginViewController: PreLoginViewController = .instantiate()
        preloginViewController.navigationItem.removeBackBarButtonTitle()
        preloginViewController.viewModel = preLoginViewModel
        navigationController.setViewControllers([preloginViewController], animated: false)
    }
}

extension PreLoginCoordinator: PreLoginCoordinatorDelegate {

    func goToCampaigns() {
        // go to campaigns
        let campaignCoordinator = CampaignCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(campaignCoordinator)
        campaignCoordinator.start()
    }

    func goToSignIn() {
        // go to sign in
        let loginCoordinator = LoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }

    func didFinishPreLogin() {
        parentCoordinator?.didFinishChild(self)
    }
}
