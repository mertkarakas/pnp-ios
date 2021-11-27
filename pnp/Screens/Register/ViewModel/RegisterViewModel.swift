//
//  RegisterViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class RegisterViewModel {

    // MARK: - Delegate

    weak var coordinatorDelegate: RegisterCoordinatorDelegate?

    // MARK: - Properties

    private let coreDataManager: CoreDataManager

    // MARK: - Init

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }

    // MARK: - internal functions

    func doRegister(username: String?, password: String?) {
        guard let username = username,
              let password = password else {
            return
        }
        
        coreDataManager.saveUser(username: username, password: password, token: 0)
        guard let user = coreDataManager.fetchUsers().first(where: { $0.username == username && $0.password == password}) else {
            return
        }
        coordinatorDelegate?.goToDashboard(with: user)
    }
    
}
