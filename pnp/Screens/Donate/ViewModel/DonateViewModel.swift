//
//  DonateViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class DonateViewModel {

    weak var coordinatorDelegate: DonateCoordinatorDelegate?

    let model: CampaignModel
    let user: User?

    init(model: CampaignModel, user: User?) {
        self.model = model
        self.user = user
    }

    func shouldPay(with amountText: String?) -> Bool {
        guard let amount = amountText,
              let amountInteger = Int32(amount),
              let userId = user,
              amountInteger > 0,
              amountInteger <= userId.izToken else {
            return false
        }
        return true
    }

    func pay(with amountText: String?) {
        guard let amount = amountText,
              let amountInteger = Int32(amount),
              let userId = user,
              amountInteger > 0,
              amountInteger <= userId.izToken else {
            return
        }
        userId.izToken = userId.izToken - amountInteger
        
        coordinatorDelegate?.goToPaymentConfirm()
    }

    func getMoreToken() {
        coordinatorDelegate?.getMoreToken()
    }
}
