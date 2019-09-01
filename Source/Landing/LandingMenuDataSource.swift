//
//  LandingMenuDataSource.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct LandingMenuDataSource {
    let dataSource = [
        [
            LandingMenuModel(title: "Onboarding"),
            LandingMenuModel(title: "Portfolio Site"),
            LandingMenuModel(title: "Photography")
        ],
        [
            LandingMenuModel(title: "War")
        ],
        [
            LandingMenuModel(title: "Schedule Notification", detailText: "Sets a local rich notification for 8 seconds.")
        ]
    ]
}
