//
//  PreLoginViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

protocol PreLoginViewModelProtocol: AnyObject {
    var banners: [String] { get }

    func showCampaignAction()
    func goToSignIn()
    func goToRegister()
}

final class PreLoginViewModel: PreLoginViewModelProtocol {

    weak var coordinatorDelegate: PreLoginCoordinatorDelegate?

    #warning("will retrieve from the service")
    let banners = ["Banner 1", "Banner 2", "Banner 3", "Banner 4", "Banner 5", "Banner 6", "Banner 7", "Banner 8"]

    func showCampaignAction() {
        coordinatorDelegate?.goToCampaigns()
    }

    func goToSignIn() {
        coordinatorDelegate?.goToSignIn()
    }

    func goToRegister() {
        coordinatorDelegate?.goToRegister()
    }
}
