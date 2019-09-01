//
//  OnboardingSummaryViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation
import UIKit

protocol OnboardingSummaryViewControllerDelegate: AnyObject {
    func onboardingSummaryViewControllerDidComplete(_ viewController: OnboardingSummaryViewController)
}

final class OnboardingSummaryViewController: BaseViewController<OnboardingSummaryView> {

    // MARK: - Properties

    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
