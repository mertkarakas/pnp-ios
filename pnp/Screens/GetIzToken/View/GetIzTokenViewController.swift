//
//  GetIzTokenViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class GetIzTokenViewController: UIViewController {

    @IBOutlet weak var izTokenTextField: UITextField!

    var viewModel: GetIzTokenViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
    }

    @IBAction func getIzTokenAction(_ sender: Any) {
        viewModel.getIzToken(with: izTokenTextField.text)
    }
}

extension GetIzTokenViewController: GetIzTokenViewModelOutputDelegate {
    func showAlert(message: String) {
        
    }
}
