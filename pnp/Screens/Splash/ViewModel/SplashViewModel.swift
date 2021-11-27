//
//  SplashViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

protocol SplashViewModelProtocol {
    var coordinatorDelegate: SplashCoordinatorDelegate? { get }

    func goToPreLogin()
}

final class SplashViewModel: SplashViewModelProtocol {

    weak var coordinatorDelegate: SplashCoordinatorDelegate?

    func goToPreLogin() {
        coordinatorDelegate?.goToPreLogin()
    }
}
