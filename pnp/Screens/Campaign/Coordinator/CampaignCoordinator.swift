//
//  CampaignCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CampaignCoordinatorDelegate: AnyObject {
    func goToDetail(with item: CampaignModel)
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
        let campaignViewModel = CampaignViewModel()
        campaignViewModel.coordinatorDelegate = self
        let campaignViewController: CampaignViewController = .instantiate()
        campaignViewController.viewModel = campaignViewModel
        campaignViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.show(campaignViewController, sender: nil)
    }
}

extension CampaignCoordinator: CampaignCoordinatorDelegate {
    func goToDetail(with item: CampaignModel) {
        let campaignDetailViewModel = CampaignDetailViewModel(item: item)
        let campaignDetailViewController: CampaignDetailViewController = .instantiate()
        campaignDetailViewController.viewModel = campaignDetailViewModel

        navigationController.present(campaignDetailViewController, animated: true, completion: nil)
    }

    func goToSignIn() {
        let loginCoordinator = LoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
}
