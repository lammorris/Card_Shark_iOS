//
//  OnboardingCoordinator.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation
import UIKit

protocol OnboardingCoordinatorDelegate: AnyObject {
    func onboardingCoordinatorDidComplete(_ coordinator: OnboardingCoordinator)
}

final class OnboardingCoordinator: Coordinator {

    // MARK: - Properties

    private let presentingViewController: UIViewController
    private var navigationController: UINavigationController?

    weak var delegate: OnboardingCoordinatorDelegate?

    // MARK: - Methods

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController

        setupNavigationController()
    }

    func start() {
        // Start Onboarding Summary
        let summaryVC = OnboardingSummaryViewController()

        navigationController = UINavigationController(rootViewController: summaryVC)
        presentingViewController.present(navigationController!, animated: true)

        // Title of Morris Lam w/ link to website.
        // Title of Photography and link to website
        // Branching at photography. Dismiss or open flow collection to instagram images
    }

    // MARK: - Private Method

    private func setupNavigationController() { }
}
