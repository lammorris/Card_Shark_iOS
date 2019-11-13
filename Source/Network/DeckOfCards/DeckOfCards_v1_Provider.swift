//
//  DeckOfCards_v1_Provider.swift
//  CardDeck
//
//  Created by Morris Lam on 9/2/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

protocol DeckOfCards_v1_Provider {
    @discardableResult
    func shuffle(queryItem: DeckOfCards.v1.QueryItem, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func draw(deckID: String, queryItem: DeckOfCards.v1.QueryItem, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func reshuffle(deckID: String, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func newDeck(queue: DispatchQueue, completion: @escaping (String) -> Void) -> URLRequest

    @discardableResult
    func partialDeck(queryItem: DeckOfCards.v1.QueryItem, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func addToPile(deckID: String, pileName: String, queryItem: DeckOfCards.v1.QueryItem, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func shufflePile(deckID: String, pileName: String, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func listCardsInPile(deckID: String, pileName: String, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest

    @discardableResult
    func drawFromPile(deckID: String, pileName: String, queryItem: DeckOfCards.v1.QueryItem, queue: DispatchQueue, completion: @escaping () -> Void) -> URLRequest
}

extension DeckOfCards_v1_Provider {
    typealias DeckOfCardsProvider = DeckOfCards_v1_Provider

    static func makeDeckOfCardsProvider(
        session: URLSession,
        baseURLString: String = "https://deckofcardsapi.com")
        -> DeckOfCards_v1_Provider
    {
        
    }
}
