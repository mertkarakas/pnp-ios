//
//  CampaignDetailCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//


import UIKit

protocol CampaignDetailCoordinatorDelegate: AnyObject {
    func goToDonate(model: CampaignModel)
}

final class CampaignDetailCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController
    private let campaignModel: CampaignModel
    private let user: User?

    init(navController: UINavigationController, dependency: DependencyContainer, campaignModel: CampaignModel, user: User?) {
        self.navigationController = navController
        self.dependency = dependency
        self.campaignModel = campaignModel
        self.user = user
    }

    func start() {
        let campaignDetailVM = CampaignDetailViewModel(item: campaignModel)
        campaignDetailVM.coordinatorDelegate = self

        let campaignDetailViewController: CampaignDetailViewController = .instantiate()
        campaignDetailViewController.viewModel = campaignDetailVM
        campaignDetailViewController.navigationItem.removeBackBarButtonTitle()

        navigationController.present(campaignDetailViewController, animated: true, completion: nil)
    }
}

extension CampaignDetailCoordinator: CampaignDetailCoordinatorDelegate {
    func goToDonate(model: CampaignModel) {
        guard let user = user else {
            let loginCoordinator = LoginCoordinator(navController: navigationController, dependency: dependency)
            childCoordinators.append(loginCoordinator)
            loginCoordinator.start()
            return
        }
        let donateCoordinator = DonateCoordinator(navController: navigationController, dependency: dependency, model: model, user: user)
        childCoordinators.append(donateCoordinator)
        donateCoordinator.start()
    }
}
