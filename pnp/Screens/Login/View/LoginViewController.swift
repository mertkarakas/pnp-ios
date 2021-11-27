//
//  LoginViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.isEnabled = false
        view.backgroundColor = .background
        passwordTextField.isSecureTextEntry = true
        usernameTextField.delegate = self
        usernameTextField.autocorrectionType = .no
        passwordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
    }

    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel.loginButtonAction(username: usernameTextField.text, password: passwordTextField.text)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        loginButton.isEnabled = viewModel.shouldEnableButton(username: usernameTextField.text, password: passwordTextField.text)
        return true
    }
}
