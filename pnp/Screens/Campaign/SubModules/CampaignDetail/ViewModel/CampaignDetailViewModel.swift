//
//  CampaignDetailViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

final class CampaignDetailViewModel {

    weak var coordinatorDelegate: CampaignDetailCoordinatorDelegate?

    let item: CampaignModel

    init(item: CampaignModel) {
        self.item = item
    }

    func donateButton() {
        coordinatorDelegate?.goToDonate(model: item)
    }
}
