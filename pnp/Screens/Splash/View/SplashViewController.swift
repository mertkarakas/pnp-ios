//
//  SplashViewController.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet private weak var splashImageView: UIImageView!
    var viewModel: SplashViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        clearNavigationBar()
        makeAnimation()
    }

    private func clearNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .white
    }

    private func makeAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {

            self.splashImageView.transform = CGAffineTransform.identity.scaledBy(x: 4, y: 4)
            self.splashImageView.layer.opacity = 0

        }) { finished in
            self.viewModel.goToPreLogin()
        }
    }
}
