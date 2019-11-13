//
//  DeckOfCardsResponse.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

struct DeckOfCardsResponse: Decodable {
    let id: String
    let remainingCards: Int
    let piles: String
    let cards: [Card]

    private enum CodingKeys: String, CodingKey {
        case id = "deck_id"
        case remainingCards = "remaining"
        case piles
        case cards
    }
}
