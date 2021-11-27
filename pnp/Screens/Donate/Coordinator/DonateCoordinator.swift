//
//  DonateCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol DonateCoordinatorDelegate: AnyObject {
    func goToPaymentConfirm()
    func getMoreToken()
}

final class DonateCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController
    private let model: CampaignModel
    private let user: User?

    init(navController: UINavigationController, dependency: DependencyContainer, model: CampaignModel, user: User?) {
        self.navigationController = navController
        self.dependency = dependency
        self.model = model
        self.user = user
    }

    func start() {
        let donateViewModel = DonateViewModel(model: model, user: user)
        donateViewModel.coordinatorDelegate = self

        let donateVC: DonateViewController = .instantiate()
        donateVC.viewModel = donateViewModel
        donateVC.navigationItem.removeBackBarButtonTitle()

        navigationController.present(UINavigationController(rootViewController: donateVC), animated: true, completion: nil)
    }
}

extension DonateCoordinator: DonateCoordinatorDelegate {
    func goToPaymentConfirm() {
        navigationController.dismiss(animated: true, completion: nil)
        let successVC: GetIzTokenResultViewController = .instantiate()
        navigationController.present(successVC, animated: true, completion: nil)
    }

    func getMoreToken() {
        navigationController.dismiss(animated: true, completion: nil)
        let coordinator = GetIzTokenCoordinator(navController: navigationController, dependency: dependency, user: user)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
