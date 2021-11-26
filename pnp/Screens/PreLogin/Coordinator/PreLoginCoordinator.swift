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
    var parentCoordinator: AppCoordinator?

    init(navController: UINavigationController) {
        self.navigationController = navController
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
        let campaignCoordinator = CampaignCoordinator(navController: navigationController)
        childCoordinators.append(campaignCoordinator)
        campaignCoordinator.start()
    }

    func goToSignIn() {
        // go to sign in
        print("go to sign in")
    }

    func didFinishPreLogin() {
        parentCoordinator?.didFinishChild(self)
    }
}
