//
//  WarCoordinator.swift
//  CardDeck
//
//  Created by Morris Lam on 8/31/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol WarCoordinatorDelegate: AnyObject { }

final class WarCoordinator: Coordinator {

    // MARK: - Properties

    weak var delegate: WarCoordinatorDelegate?

    private let navigationController: UINavigationController
    private let rangeOfPlayers: [Int] = Array(2...4)

    // MARK: - Initialization

    init(
        navigationController: UINavigationController)
    {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        let warSetupViewController = WarSetupViewController(rangeOfPlayers: rangeOfPlayers)

        navigationController.pushViewController(warSetupViewController, animated: true)
    }

    // MARK: - Private Methods
}
