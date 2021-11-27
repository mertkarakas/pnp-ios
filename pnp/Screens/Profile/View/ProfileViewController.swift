//
//  ProfileViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModelProtocol!
    @IBOutlet weak var izTokenCountLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        izTokenCountLabel.text = "\(viewModel.user?.izToken ?? 0)"
    }

    private func prepareUI() {
        view.backgroundColor = .background
        usernameLabel.text = viewModel.user?.username
    }

    @IBAction func logoutButtonAction(_ sender: Any) {
        viewModel.logout()
    }
}
