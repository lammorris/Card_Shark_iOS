//
//  Player.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

struct Player: Hashable {
    let name: String
    let cardsRemaining: Int
    let activeCard: String?
}
