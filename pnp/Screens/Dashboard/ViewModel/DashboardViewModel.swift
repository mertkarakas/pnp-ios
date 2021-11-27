//
//  DashboardViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class DashboardViewModel {

    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    let banners = ["banner1", "banner1", "mobile-hackathon", "mobile-hackathon"]

    func goToNewCampaign() {
        coordinatorDelegate?.goToNewCampaign()
    }
}
