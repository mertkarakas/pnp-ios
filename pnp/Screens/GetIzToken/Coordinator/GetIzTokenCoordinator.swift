//
//  GetIzTokenCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol GetIzTokenCoordinatorDelegate: AnyObject {
    func getIzToken()
}

final class GetIzTokenCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController
    private let user: User?

    init(navController: UINavigationController, dependency: DependencyContainer, user: User?) {
        self.navigationController = navController
        self.dependency = dependency
        self.user = user
    }

    func start() {
        let getIzTokenVM = GetIzTokenViewModel(user: user)
        getIzTokenVM.coordinatorDelegate = self

        let getIztokenViewController: GetIzTokenViewController = .instantiate()
        getIztokenViewController.viewModel = getIzTokenVM
        getIztokenViewController.navigationItem.removeBackBarButtonTitle()

        navigationController.present(getIztokenViewController, animated: true, completion: nil)
    }
}

extension GetIzTokenCoordinator: GetIzTokenCoordinatorDelegate {

    func getIzToken() {
        navigationController.dismiss(animated: true, completion: nil)
        let izTokenResult: GetIzTokenResultViewController = .instantiate()
        navigationController.present(izTokenResult, animated: true, completion: nil)

//        let iztokenResultCoordinator = GetIzTokenResultCoordinator(navController: navigationController, dependency: dependency)
//        childCoordinators.append(iztokenResultCoordinator)
//        iztokenResultCoordinator.start()
//        let izTokenResult: GetIzTokenResultViewController = .instantiate()
//        navigationController.show(izTokenResult, sender: nil)
    }
}
