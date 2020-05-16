//
//  WarView.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class WarView: BaseView {

    private struct Layout {
        static let margin: CGFloat = 20.0
        static let collectionViewMinimumLineSpacing: CGFloat = 0
        static let collectionViewMinimumInterspacing: CGFloat = 0
        static let numberOfColumns: CGFloat = 2
        static let numberOfRows: CGFloat = 2
    }

    // MARK: - Properties

    let collectionView: UICollectionView
    let closeButton: UIButton
    let nextRoundButton: UIButton

    // MARK: - Initialization

    override init(frame: CGRect) {
        closeButton = {
            let view = UIButton()
            view.setTitle("Close", for: .normal)
            view.setTitleColor(view.tintColor, for: .normal)

            return view
        }()

        nextRoundButton = {
            let view = UIButton()
            view.setTitle("Next Round", for: .normal)
            view.setTitleColor(view.tintColor, for: .normal)

            return view
        }()

        collectionView = {
            let flowLayout = UICollectionViewFlowLayout()
            let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
            view.backgroundColor = .white

            return view
        }()

        super.init(frame: frame)

        collectionView.delegate = self
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
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeButton.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Layout.margin),
            collectionView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: Layout.margin),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: Layout.margin),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Layout.margin),
            nextRoundButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Layout.margin),
            nextRoundButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            nextRoundButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            nextRoundButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension WarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width / Layout.numberOfColumns, height: collectionView.bounds.size.height / Layout.numberOfRows)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.collectionViewMinimumLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.collectionViewMinimumInterspacing
    }
}
