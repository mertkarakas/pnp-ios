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

        sliderImageView.contentMode = .scaleAspectFill
        sliderImageView.image = UIImage(named: imageString)
    }
}
