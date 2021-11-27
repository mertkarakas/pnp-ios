//
//  NewCampaignCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol NewCampaignCoordinatorDelegate: AnyObject {
    func fireCampaign()
}

final class NewCampaignCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    let navigationController: UINavigationController
    private let dependency: DependencyContainer

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let newCampaignViewModel = NewCampaignViewModel(coreDataManager: dependency.coreDataManager)
        newCampaignViewModel.coordinatorDelegate = self
        let newCampaignViewController: NewCampaignViewController = .instantiate()
        newCampaignViewController.viewModel = newCampaignViewModel
        newCampaignViewController.navigationItem.removeBackBarButtonTitle()
        navigationController.present(newCampaignViewController, animated: true, completion: nil)
    }
}

extension NewCampaignCoordinator: NewCampaignCoordinatorDelegate {
    func fireCampaign() {
        navigationController.dismiss(animated: true, completion: nil)
        let successVC: GetIzTokenResultViewController = .instantiate()
        navigationController.present(successVC, animated: true, completion: nil)
    }
}

