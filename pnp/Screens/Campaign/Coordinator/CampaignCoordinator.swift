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
    let navigationController: UINavigationController

    init(navController: UINavigationController) {
        self.navigationController = navController
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
        let loginCoordinator = LoginCoordinator(navController: navigationController)
        childCoordinators.append(loginCoordinator)
        loginCoordinator.start()
    }
}
