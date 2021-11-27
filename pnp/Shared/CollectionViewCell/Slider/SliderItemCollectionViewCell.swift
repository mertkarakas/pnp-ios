//
//  SliderItemCollectionViewCell.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

final class SliderItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sliderImageView: UIImageView!

    func configure(imageString: String) {
        sliderImageView.layer.cornerRadius = 4
        sliderImageView.layer.borderWidth = 1
        sliderImageView.layer.borderColor = UIColor.lightGray.cgColor
        sliderImageView.contentMode = .scaleAspectFill
        sliderImageView.image = UIImage(named: imageString)
    }
}
