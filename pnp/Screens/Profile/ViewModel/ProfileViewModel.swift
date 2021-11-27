//
//  ProfileViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

protocol ProfileViewModelProtocol {
    var user: User? { get }

    func logout()
    func getIzToken()
}

final class ProfileViewModel: ProfileViewModelProtocol {

    weak var coordinatorDelegate: ProfileCoordinatorDelegate?
    let user: User?

    init(user: User?) {
        self.user = user
    }
    
    func logout() {
        coordinatorDelegate?.logout()
    }

    func getIzToken() {
        coordinatorDelegate?.getIzToken()
    }
}
