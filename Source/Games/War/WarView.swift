//
//  WarView.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class WarView: BaseView {

    // MARK: - Properties

    private let collectionView: UICollectionView

    // MARK: - Initialization

    override init(frame: CGRect) {
        collectionView = {
            let view = UICollectionView()

            return view
        }()

        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func constructSubviewHierarchy() {
        super.constructSubviewHierarchy()

        addSubview(collectionView)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

        ])
    }
}
