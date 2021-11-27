//
//  LoginViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import CoreData

protocol LoginViewModelOutputDelegate: AnyObject {
    func showAlert(message: String)
}

final class LoginViewModel {

    //  MARK: - Delegates

    weak var loginCoordinator: LoginCoordinatorDelegate?
    weak var delegate: LoginViewModelOutputDelegate?

    // MARK: - Properties

    let coreDataManager: CoreDataManager
    let users: [User]

    // MARK: - Init

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        if coreDataManager.fetchUsers().isEmpty {
            coreDataManager.saveUser(username: "pnp", password: "123456", token: 17)
            users = coreDataManager.fetchUsers()
        } else {
            users = coreDataManager.fetchUsers()
        }
    }

    func shouldEnableButton(username: String?, password: String?) -> Bool {
        guard let username = username,
              let password = password,
              !username.isEmpty,
              !password.isEmpty else {
            return false
        }
        return true
    }

    func loginButtonAction(username: String?, password: String?) {
        guard let username = username,
              let password = password else {
            return
        }
        if let user = users.first(where:  {$0.username == username && $0.password == password}) {
            loginCoordinator?.goToDashboard(with: user)
        } else {
            delegate?.showAlert(message: "Girdiğiniz bilgileri tekrar kontrol edin.")
        }
    }
}
