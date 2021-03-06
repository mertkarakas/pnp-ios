//
//  CampaignViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CampaignCollectionCellDelegate: AnyObject {
    func didSelectItem(with item: Campaign)
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

        viewModel.delegate = self
        view.backgroundColor = .background
        campaignCollectionView.register(UINib(nibName: Constants.campaignCollectionViewNibName, bundle: .main), forCellWithReuseIdentifier: Constants.campaignCollectionViewReuseIdentifier)
        campaignCollectionView.setCollectionViewLayout(ListFlowLayout(), animated: false)
        campaignCollectionView.delegate = self
        campaignCollectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.refreshItems()
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
        viewModel.reOrderedModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.campaignCollectionViewReuseIdentifier, for: indexPath) as? CampaignCollectionViewCell {
            let item = viewModel.reOrderedModels[indexPath.row]
            cell.configureCell(item: item)
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(with: viewModel.reOrderedModels[indexPath.row])
        viewModel.didSelectItem(at: indexPath.row)
    }
}

extension CampaignViewController: CampaignViewModelOutput {

    func refreshCollection() {
        self.campaignCollectionView.reloadData()
    }
}
