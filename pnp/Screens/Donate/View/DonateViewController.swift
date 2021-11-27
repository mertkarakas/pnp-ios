//
//  DonateViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class DonateViewController: UIViewController {

    var viewModel: DonateViewModel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var paymentActionButton: PrimaryButton!
    @IBOutlet weak var amountTextfield: UITextField!
    @IBOutlet weak var getMoreTokenButton: PrimaryButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareUI()
    }

    private func prepareUI() {
        title = "İyilik Yap"
        balanceLabel.text = "\(viewModel.user?.izToken ?? 0)"
        paymentActionButton.isEnabled = false
        amountTextfield.delegate = self
        amountTextfield.keyboardType = .decimalPad
    }
    @IBAction func paymentAction(_ sender: Any) {
        paymentActionButton.isEnabled = viewModel.shouldPay(with: amountTextfield.text)
        viewModel.pay(with: amountTextfield.text)

    }
    @IBAction func getMoreTokenAction(_ sender: Any) {
        viewModel.getMoreToken()
    }
}

extension DonateViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        paymentActionButton.isEnabled = viewModel.shouldPay(with: textField.text)
    }
}
