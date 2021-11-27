//
//  CampaignCollectionViewCell.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

final class CampaignCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var campaignImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureCell(item: CampaignModel) {
        layer.cornerRadius = 8

        titleLabel.text = item.title
        progressView.setProgress(item.calculatedProgress(), animated: true)
        campaignImageView.image = UIImage(named: item.image)
        amountLabel.text = "% \(item.percentage())"
    }
}
