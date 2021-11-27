//
//  ProfileViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class ProfileViewController: UIViewController {

    var viewModel: ProfileViewModelProtocol!

    @IBOutlet weak var usernameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {
        view.backgroundColor = .background
    }

    @IBAction func logoutButtonAction(_ sender: Any) {
        viewModel.logout()
    }
}
