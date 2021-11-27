//
//  PreLoginViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

final class PreLoginViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let sliderCollectionViewNibName = "SliderItemCollectionViewCell"
        static let sliderCollectionViewReuseIdentifier = "SliderCell"
        static let loginTitle = "Giriş Yap"
        static let rightBarButtonImage = "rectangle.and.pencil.and.ellipsis"
    }

    // MARK: - Properties

    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var showCampaignsButton: UIButton!
    private var timer: Timer!
    var viewModel: PreLoginViewModelProtocol!

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.register(UINib(nibName: Constants.sliderCollectionViewNibName, bundle: .main), forCellWithReuseIdentifier: Constants.sliderCollectionViewReuseIdentifier)
        pageControl.numberOfPages = viewModel.banners.count
        pageControl.currentPage = 0

        prepareUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTimer()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }

    // MARK: - UI

    private func prepareUI() {

        navigationItem.rightBarButtonItem = UIBarButtonItem.makeSignInButton(selector: #selector(rightBarButtonAction), target: self)
    }

    // MARK: - Actions

    @objc private func rightBarButtonAction() {
        viewModel.goToSignIn()
    }

    @IBAction private func showCampaignsButtonAction(_ sender: Any) {
        viewModel.showCampaignAction()
    }
}

// MARK: - UICollectionViewDataSource

extension PreLoginViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.sliderCollectionViewReuseIdentifier, for: indexPath) as? SliderItemCollectionViewCell {

            cell.configure(imageString: viewModel.banners[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PreLoginViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.bounds.size
    }
}

// MARK: - Auto Scroll Slider

extension PreLoginViewController {

    @objc private func scrollToNextCell() {
        if pageControl.currentPage == pageControl.numberOfPages - 1 {
            sliderCollectionView.scrollToItem(
                at: IndexPath(row: 0, section: 0),
                at: .left,
                animated: true
            )
            return
        }
        let cellSize = CGSize(width: view.frame.width, height: view.frame.height)

        let contentOffset = sliderCollectionView.contentOffset;

        sliderCollectionView.scrollRectToVisible(
            CGRect(x: contentOffset.x + cellSize.width,
                   y: contentOffset.y,
                   width: cellSize.width,
                   height: cellSize.height),
            animated: true)
    }

    private func setTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 5.0,
            target: self,
            selector: #selector(scrollToNextCell),
            userInfo: nil,
            repeats: true)
        timer.fire()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex = sliderCollectionView.contentOffset.x / sliderCollectionView.frame.size.width
        pageControl.currentPage = Int(currentIndex)
    }
}
