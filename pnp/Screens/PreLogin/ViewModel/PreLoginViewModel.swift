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
}

final class PreLoginViewModel: PreLoginViewModelProtocol {

    weak var coordinatorDelegate: PreLoginCoordinatorDelegate?

    #warning("will retrieve from the service")
    let banners = ["banner1", "banner1", "mobile-hackathon", "mobile-hackathon"]

    func showCampaignAction() {
        coordinatorDelegate?.goToCampaigns()
    }

    func goToSignIn() {
        coordinatorDelegate?.goToSignIn()
    }
}
