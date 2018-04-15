//
//  Response.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import Foundation

struct Response: Codable {
    let deck_id: String
    let shuffled: Bool?
    let remaining: Int
    let success: Bool
    let cards: [Card]?
    let error: String?
}
