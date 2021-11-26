//
//  CampaignViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CampaignCollectionCellDelegate: AnyObject {
    func didSelectItem(with item: CampaignModel)
}

final class CampaignViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let campaignCollectionViewNibName = "CampaignCollectionViewCell"
        static let campaignCollectionViewReuseIdentifier = "CampaignCell"

    }

    // MARK: - Properties

    @IBOutlet private weak var campaignCollectionView: UICollectionView!
    var viewModel: CampaignViewModel!
    weak var delegate: CampaignCollectionCellDelegate?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        campaignCollectionView.register(UINib(nibName: Constants.campaignCollectionViewNibName, bundle: .main), forCellWithReuseIdentifier: Constants.campaignCollectionViewReuseIdentifier)
        campaignCollectionView.setCollectionViewLayout(ListFlowLayout(), animated: false)
        campaignCollectionView.delegate = self
        campaignCollectionView.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem.makeSignInButton(selector: #selector(rightBarButtonAction), target: self)

    }

    // MARK: - Actions

    @objc private func rightBarButtonAction() {
        viewModel.goToSignIn()
    }
}

// MARK: - UICollectionViewDelegate

extension CampaignViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.campaignCollectionViewReuseIdentifier, for: indexPath) as? CampaignCollectionViewCell {
            let item = viewModel.models[indexPath.row]
            cell.configureCell(item: item)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(with: viewModel.models[indexPath.row])
        viewModel.didSelectItem(at: indexPath.row)
    }
}
