//
//  PrimaryButton.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class PrimaryButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            isActive(isEnabled)
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }

    private func configure() {
        layer.cornerRadius = 8
        backgroundColor = .white
        tintColor = .primary
        setTitleColor(.primary, for: .normal)
        setTitleColor(.white, for: .disabled)
        contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    private func isActive(_ isActive: Bool) {
        backgroundColor = isActive ? .white : .gray
    }
}
