//
//  DeckOfCards_v1_QueryItem.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

extension DeckOfCards.v1 {
    enum QueryItem {
        struct KeyPath {
            static let cards = "cards"
            static let count = "count"
            static let deckCount = "deck_count"
        }

        case cards(_ cards: [String])
        case count(_ count: Int)
        case deckCount(_ deckCount: Int)

        var stringValue: String {
            switch self {
            case let .cards(cards):
                return cards.joined(separator: ",")

            case let .count(count):
                return String(count)

            case let .deckCount(deckCount):
                return String(deckCount)
            }
        }
    }
}
