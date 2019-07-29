//
//  LandingMenuModel.swift
//  CardDeck
//
//  Created by Morris Lam on 7/28/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct LandingMenuModel: Codable {
    let title: String
    let detailText: String?

    init(title: String, detailText: String? = nil) {
        self.title = title
        self.detailText = detailText
    }
}
