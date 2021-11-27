//
//  SplashViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class SplashViewModel {

    weak var coordinatorDelegate: SplashCoordinatorDelegate?

    func goToPreLogin() {
        coordinatorDelegate?.goToPreLogin()
    }
}
