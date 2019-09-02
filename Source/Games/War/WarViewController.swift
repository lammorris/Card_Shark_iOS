//
//  WarViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarViewControllerDelegate: AnyObject { }

final class WarViewController: BaseViewController<WarView> {

    // MARK: - Properties

    weak var delegate: WarViewControllerDelegate?

    private let reuseIdentifier = "PlayerCell"
    private let players: Set<Player>

    // MARK: - Initialization

    init(players: Set<Player>) {
        self.players = players

        super.init()

        rootView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        rootView.collectionView.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    // MARK: - Private Methods
}

extension WarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension WarViewController: UICollectionViewDelegate {

}
