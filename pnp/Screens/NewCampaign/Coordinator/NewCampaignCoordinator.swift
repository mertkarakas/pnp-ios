//
//  NewCampaignCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol NewCampaignCoordinatorDelegate: AnyObject {
}

final class NewCampaignCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
    }

    func start() {
        let newCampaignViewModel = NewCampaignViewModel()
        newCampaignViewModel.coordinatorDelegate = self
        let newCampaignViewController: NewCampaignViewController = .instantiate()
        newCampaignViewController.viewModel = newCampaignViewModel
        newCampaignViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.present(newCampaignViewController, animated: true, completion: nil)
    }
}

extension NewCampaignCoordinator: NewCampaignCoordinatorDelegate {

}

