//
//  UIViewController+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

protocol CampaignViewModelProtocol {
    var models: [CampaignModel] { get }

    func didSelectItem(at index: Int)
    func goToSignIn()
}

final class CampaignViewModel: CampaignViewModelProtocol {

    weak var coordinatorDelegate: CampaignCoordinatorDelegate?

    #warning("Models will retrieve from the service.")
    let models: [CampaignModel] = [
        .init(title:"Lorem ipsum dolor sit amet",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu sodales nisi. Nam eget risus convallis, euismod lectus sed, feugiat mauris.",
              maxAmount: 2000,
              reachedAmount: 1500,
              image: "campaign1"
        ),
        .init(title:"Consectetur adipiscing elit.",
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu sodales nisi. Nam eget risus convallis, euismod lectus sed, feugiat mauris.",
              maxAmount: 2000,
              reachedAmount: 1800,
              image: "campaign2"
        )
    ]

    func didSelectItem(at index: Int) {
        coordinatorDelegate?.goToDetail(with: models[index])
    }

    func goToSignIn() {
        coordinatorDelegate?.goToSignIn()
    }
}
