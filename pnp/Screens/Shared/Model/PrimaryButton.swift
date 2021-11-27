//
//  PrimaryButton.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class PrimaryButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }

    private func configure() {
        layer.cornerRadius = 4
        backgroundColor = .primary
        tintColor = .white
        setTitleColor(.white, for: .normal)
        setTitleColor(.background, for: .disabled)
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
