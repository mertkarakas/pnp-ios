//
//  CampaignCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CampaignCoordinatorDelegate: AnyObject {
    func goToDetail(with item: Campaign)
    func goToSignIn()
}

final class CampaignCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let campaignViewModel = CampaignViewModel(coreDataManager: dependency.coreDataManager)
        campaignViewModel.coordinatorDelegate = self
        let campaignViewController: CampaignViewController = .instantiate()
        campaignViewController.viewModel = campaignViewModel
        campaignViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.show(campaignViewController, sender: nil)
    }
}

extension CampaignCoordinator: CampaignCoordinatorDelegate {
    func goToDetail(with item: Campaign) {
        let campaignDetailCoordinator = CampaignDetailCoordinator(navController: navigationController, dependency: dependency, campaignModel: item, user: nil)
        childCoordinators.append(campaignDetailCoordinator)
        campaignDetailCoordinator.start()
    }

    func goToSignIn() {
        let loginCoordinator = LoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
}
