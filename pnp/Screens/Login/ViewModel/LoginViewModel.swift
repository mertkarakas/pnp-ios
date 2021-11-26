//
//  LoginViewModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final class LoginViewModel {

    weak var loginCoordinator: LoginCoordinatorDelegate?

    var onUpdate: () -> Void = {}
    let cells: [CellType] = [
        .titleSubtitle(.init(title: "Kullanıcı adı", subtitle: "", placeholder: "Kullanıcı adı seçiniz")),
        .titleSubtitle(.init(title: "Şifre", subtitle: "", placeholder: "Şifreniz"))
    ]

    func shouldEnableButton(username: String?, password: String?) -> Bool {
        guard let username = username,
              let password = password,
              !username.isEmpty,
              !password.isEmpty else {
            return false
        }
        return true
    }
}
