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
    @IBOutlet weak var totalAmountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configureCell(item: Campaign) {
        layer.cornerRadius = 8

        let itemModel = CampaignModel(
            title: item.title,
            description: item.subtitle,
            maxAmount: item.totalAmount as Decimal?,
            reachedAmount: item.reachedAmount as Decimal?,
            image: item.imageData
        )

        titleLabel.text = itemModel.title
        progressView.setProgress(itemModel.calculatedProgress(), animated: true)
        if let data = item.imageData {
            campaignImageView.image = UIImage(data: data)
        }
        totalAmountLabel.text = "\(itemModel.maxAmount ?? 0) IZT"
        amountLabel.text = "% \(itemModel.percentage())"
    }
}
