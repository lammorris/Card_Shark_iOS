//
//  OnboardingSummaryView.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

final class OnboardingSummaryView: BaseView {

    // MARK: - Properties

    private let label: UILabel

    // MARK: - Initialization

    override init(frame: CGRect) {
        label = {
            let label = UILabel()
            label.textAlignment = .center
            label.text = "Testing"

            return label
        }()

        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func constructSubviewHierarchy() {
        addSubview(label)
    }

    override func constructSubviewLayoutConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.safeAreaLayoutGuide.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            label.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            label.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            label.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
