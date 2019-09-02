//
//  WarCoordinator.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarCoordinatorDelegate: AnyObject {
    func warCoordinatorDidComplete(_ coordinator: WarCoordinator)
}

final class WarCoordinator: Coordinator {

    // MARK: - Properties

    weak var delegate: WarCoordinatorDelegate?

    private let navigationController: UINavigationController
    private let rangeOfPlayers: [Int] = Array(2...4)
    private var viewController: UIViewController?

    // MARK: - Initialization

    init(
        navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let warSetupViewController = WarSetupViewController(rangeOfPlayers: rangeOfPlayers)
        warSetupViewController.delegate = self

        navigationController.pushViewController(warSetupViewController, animated: true)
    }

    // MARK: - Private Methods
}

extension WarCoordinator: WarSetupViewControllerDelegate {
    func warSetupViewController(_ viewController: WarSetupViewController, didComplete playerNames: [String]) {
        let players: Set<Player> = Set(playerNames.map {
            // TODO: Make network request here to create game and parse cards
            Player(name: $0, cardsRemaining: 1, activeCard: nil)
        })

        let warViewController = WarViewController(players: players)
        warViewController.delegate = self

        navigationController.present(warViewController, animated: true)
    }
}

extension WarCoordinator: WarViewControllerDelegate {
    
}
