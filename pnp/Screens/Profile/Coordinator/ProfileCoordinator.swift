//
//  ProfileCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {
    func logout()
    func getIzToken()
}

final class ProfileCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let profileViewModel = ProfileViewModel(user: nil)
        profileViewModel.coordinatorDelegate = self

        let profileViewController: ProfileViewController = .instantiate()
        profileViewController.viewModel = profileViewModel
        profileViewController.navigationItem.removeBackBarButtonTitle()

        navigationController.setViewControllers([profileViewController], animated: false)
    }
}

extension ProfileCoordinator: ProfileCoordinatorDelegate {
    func logout() {
        let preloginCoordinator = PreLoginCoordinator(navController: navigationController, dependency: dependency)
        childCoordinators.append(preloginCoordinator)
        preloginCoordinator.start()
    }

    func getIzToken() {
        let getIztoken = GetIzTokenCoordinator(navController: navigationController, dependency: dependency, user: nil)
        childCoordinators.append(getIztoken)
        getIztoken.start()
    }
}

