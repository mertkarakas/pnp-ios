//
//  DashboardViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class DashboardViewModel {

    weak var coordinatorDelegate: DashboardCoordinatorDelegate?

    #warning("will retrieve from the service")
    let banners = ["Banner 1", "Banner 2", "Banner 3", "Banner 4", "Banner 5", "Banner 6", "Banner 7", "Banner 8"]

    func goToNewCampaign() {
        coordinatorDelegate?.goToNewCampaign()
    }
}
