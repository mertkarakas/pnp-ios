//
//  LoginViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import CoreData

final class LoginViewModel {

    weak var loginCoordinator: LoginCoordinatorDelegate?
    let coreDataManager: CoreDataManager
    let users: [User]

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        if coreDataManager.fetchUsers().isEmpty {
            coreDataManager.saveUser(username: "mert", password: "123456")
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
            loginCoordinator?.goToDashboard()
        } else {
            // Alert
        }
    }
}
