//
//  Card.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct Card: Decodable {
    enum Suit: String, Codable {
        case diamond = "DIAMONDS"
        case club = "CLUBS"
        case heart = "HEARTS"
        case spade = "SPADES"
    }

    enum Value: String, Codable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "JACK"
        case queen = "QUEEN"
        case king = "KING"
        case ace = "ACE"
    }

    let image: URL
    let value: Value
    let suit: Suit
    let code: String
}
