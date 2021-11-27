//
//  GetIzTokenViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

protocol GetIzTokenViewModelOutputDelegate: AnyObject {
    func showAlert(message: String)
}

final class GetIzTokenViewModel {

    weak var coordinatorDelegate: GetIzTokenCoordinatorDelegate?
    weak var delegate: GetIzTokenViewModelOutputDelegate?

    let user: User?

    init(user: User?) {
        self.user = user
    }
    func getIzToken(with amount: String?) {
        guard let amount = amount,
              let intAmount = Int32(amount),
              let user = user,
              intAmount > 0 else {
            return
        }

        user.izToken = intAmount + user.izToken
        user.didSave()
      //  delegate?.showAlert(message: "İşlem başarılı.")
        coordinatorDelegate?.getIzToken()
    }
}
