//
//  CampaignDetailViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

final class CampaignDetailViewController: UIViewController {

    var viewModel: CampaignDetailViewModel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    private func prepareUI() {
        let item = viewModel.item
        detailImageView.image = UIImage(named: item.image)
        detailImageView.layer.cornerRadius = 4
        titleLabel.text = item.title
        descriptionLabel.text = item.description
    }

    @IBAction func shareAction(_ sender: Any) {
    }

    @IBAction func donateButtonAction(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            self?.viewModel.donateButton()
        }
    }
}
