//
//  ProfileViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

protocol ProfileViewModelProtocol {
    func logout()
}

final class ProfileViewModel: ProfileViewModelProtocol {

    weak var coordinatorDelegate: ProfileCoordinatorDelegate?
    
    func logout() {
        coordinatorDelegate?.logout()
    }
}
