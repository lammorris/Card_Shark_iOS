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

    let collectionView: UICollectionView

    private let closeButton: UIButton
    private let nextRoundButton: UIButton

    // MARK: - Initialization

    override init(frame: CGRect) {
        closeButton = {
            let view = UIButton()
            view.setTitle("Close", for: .normal)

            return view
        }()

        nextRoundButton = {
            let view = UIButton()
            view.setTitle("Next Round", for: .normal)

            return view
        }()

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

        addSubview(closeButton)
        addSubview(nextRoundButton)
        addSubview(collectionView)
    }

    override func constructSubviewLayoutConstraints() {
        super.constructSubviewLayoutConstraints()

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        nextRoundButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

        ])
    }
}
