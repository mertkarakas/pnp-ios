//
//  ListFlowLayout.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import Foundation
import UIKit

class ListFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Constants

    let itemHeight: CGFloat = 300

    // MARK: - Initialize

    override init() {
        super.init()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }

    func setupLayout() {
        minimumInteritemSpacing = 0
        minimumLineSpacing = 20
        sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        scrollDirection = .vertical
    }

    var itemWidth: CGFloat {

        return collectionView!.frame.width - 32
    }

    override var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: itemWidth, height: itemHeight)
        }
        get {
            return CGSize(width: itemWidth, height: itemHeight)
        }
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return collectionView!.contentOffset
    }
}
