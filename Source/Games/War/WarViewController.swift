//
//  WarViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarViewControllerDelegate: AnyObject {
    func warViewControllerDidComplete(_ viewController: WarViewController)
}

final class WarViewController: BaseViewController<WarView> {

    // MARK: - Properties

    weak var delegate: WarViewControllerDelegate?

    private let reuseIdentifier = "PlayerCell"
    private let players: [Player]

    // MARK: - Initialization

    init(players: [Player]) {
        self.players = players

        super.init()

        rootView.collectionView.dataSource = self
        rootView.collectionView.register(PlayerCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        rootView.closeButton.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    // MARK: - Private Methods

    @objc private func closeTapped() {
        delegate?.warViewControllerDidComplete(self)
    }
}

extension WarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayerCell

        cell.update(playerInfo: players[indexPath.row])

        return cell
    }
}
