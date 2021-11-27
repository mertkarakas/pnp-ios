//
//  RegisterViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class RegisterViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var walletAddressTextField: UITextField!
    @IBOutlet weak var registerButton: PrimaryButton!

    // MARK: - ViewModel

    var viewModel: RegisterViewModel!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextfield.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        walletAddressTextField.delegate = self
        registerButton.isEnabled = false
    }

    @IBAction func registerButtonAction(_ sender: Any) {
        viewModel.doRegister(username: usernameTextfield.text, password: passwordTextField.text)
    }
}

extension RegisterViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        [usernameTextfield, emailTextField, passwordTextField, walletAddressTextField].forEach { (item) in
            guard let text = item?.text,
                  !text.isEmpty else {
                registerButton.isEnabled = false
                return
            }
            registerButton.isEnabled = true
        }
    }
}
