//
//  NewCampaignViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class NewCampaignViewController: UIViewController {

    var viewModel: NewCampaignViewModel!
    @IBOutlet weak var newCampaignButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {
    }
}
