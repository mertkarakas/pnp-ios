//
//  DashboardViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class DashboardViewController: UIViewController {

    @IBOutlet weak var newCampaignButton: UIButton!

    var viewModel: DashboardViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {
    }

    @IBAction func buttonAction(_ sender: Any) {
        viewModel.goToNewCampaign()
    }
}
