//
//  NewCampaignViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import Foundation

final class NewCampaignViewModel {

    weak var coordinatorDelegate: NewCampaignCoordinatorDelegate?

    // MARK: - Properties
    private let coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    func fireNewCampaign(
        title: String?,
        subtitle: String?,
        targetAmount: String?,
        image: Data?
    ) {
        guard let title = title,
              let subtitle = subtitle,
              let targetAmount = targetAmount,
              let decimalTargetAmount = Decimal(string: targetAmount) else {
            return
        }
        coreDataManager.saveCampaign(title: title, description: subtitle, image: image, totalAmount: decimalTargetAmount, reachedAmound: 0)
        coordinatorDelegate?.fireCampaign()
    }
}
