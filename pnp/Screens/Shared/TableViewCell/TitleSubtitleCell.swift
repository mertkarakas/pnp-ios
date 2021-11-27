//
//  TitleSubtitleCell.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {

    private enum Constants {
        static let standardPadding: CGFloat = 15
    }

    private var titleLabel = UILabel()
    private var subtitleTextField = UITextField()
    private var verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    func configure(with model: TitleSubtitleCellModel) {
        titleLabel.text = model.title
        subtitleTextField.text = model.subtitle
        subtitleTextField.placeholder = model.placeholder

        prepareUI()
    }

    private func prepareUI() {
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)

        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(subtitleTextField)

        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.standardPadding),
            verticalStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.standardPadding),
            verticalStack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.standardPadding),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.standardPadding),
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
