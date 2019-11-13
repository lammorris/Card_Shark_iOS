//
//  DeckOfCards_v1_Service.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

extension DeckOfCards.v1 {
    struct DeckOfCards_v1_Service: DeckOfCards_v1_Provider {
        func shuffle(
            queryItem: DeckOfCards.v1.QueryItem,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func draw(
            deckID: String,
            queryItem: DeckOfCards.v1.QueryItem,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func reshuffle(
            deckID: String,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func newDeck(
            queue: DispatchQueue,
            completion: @escaping (String) -> Void)
            -> URLRequest
        {
            let endpoint = DeckOfCardsEndpoint.newDeck
        }

        func partialDeck(
            queryItem: DeckOfCards.v1.QueryItem,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func addToPile(
            deckID: String,
            pileName: String,
            queryItem: DeckOfCards.v1.QueryItem,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func shufflePile(
            deckID: String,
            pileName: String,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func listCardsInPile(
            deckID: String,
            pileName: String,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }

        func drawFromPile(
            deckID: String,
            pileName: String,
            queryItem: DeckOfCards.v1.QueryItem,
            queue: DispatchQueue,
            completion: @escaping () -> Void)
            -> URLRequest
        {
            <#code#>
        }
    }
}
