//
//  GetIzTokenResultCoordinator.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

protocol GetIzTokenResultCoordinatorDelegate: AnyObject {

}

final class GetIzTokenResultCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []
    private let dependency: DependencyContainer
    let navigationController: UINavigationController

    init(navController: UINavigationController, dependency: DependencyContainer) {
        self.navigationController = navController
        self.dependency = dependency
    }

    func start() {
        let getIztokenViewController: GetIzTokenResultViewController = .instantiate()
        getIztokenViewController.navigationItem.removeBackBarButtonTitle()

        navigationController.show(getIztokenViewController, sender: nil)
    }
}

extension GetIzTokenResultCoordinator: GetIzTokenResultCoordinatorDelegate {

}
