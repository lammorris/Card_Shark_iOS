//
//  Card.swift
//  Card_Shark_iOS
//
//  Created by Lam, Morris on 4/14/18.
//  Copyright © 2018 MorrisLam. All rights reserved.
//

import Foundation

struct Card: Codable {

    enum Suits: String, Codable {
        case DIAMONDS
        case CLUBS
        case HEARTS
        case SPADES
    }

    let suit: Suits
    let code: String
    let value: String
    let image: String
}
