//
//  DeckOfCards_v1_Endpoint.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

extension DeckOfCards.v1 {
    enum Deck: Endpoint {
        case shuffle(queryItem: QueryItem)
        case draw(deckID: String, queryItem: QueryItem)
        case reshuffle(deckID: String)
        case newDeck
        case partialDeck(queryItem: QueryItem)
        case addToPile(deckID: String, pileName: String, queryItem: QueryItem)
        case shufflePile(deckID: String, pileName: String)
        case listCardsInPile(deckID: String, pileName: String)
        case drawFromPile(deckID: String, pileName: String, queryItem: QueryItem)

        var httpMethod: HTTPMethod { return .get }

        var validStatusCodes: [Int] { return [200] }

        func path() throws -> String {
            switch self {
            case .shuffle:
                return "/new/shuffle/"

            case let .draw(deckID):
                return "\(deckID)/draw/"

            case let .reshuffle(deckID):
                return "\(deckID)/shuffle/"

            case .newDeck:
                return "/new/"

            case .partialDeck:
                return "/new/shuffle/"

            case let .addToPile(deckID, pileName, _):
                return "/\(deckID)/pile/\(pileName)/add/"

            case let .shufflePile(deckID, pileName):
                return "/\(deckID)/pile/\(pileName)/shuffle/"

            case let .listCardsInPile(deckID, pileName):
                return "/\(deckID)/pile/\(pileName)/list/"

            case let .drawFromPile(deckID, pileName, _):
                return "/\(deckID)/pile/\(pileName)/draw/"
            }
        }

        func queryParameters() throws -> QueryParameters {
            let queryParameters: QueryParameters = [:]

            switch self {
            default:
                break
            }

            return queryParameters
        }

        func headers() throws -> Headers {
            switch self {
            default:
                break
            }

            return [:]
        }

        func body() throws -> Body? { return nil }
    }
}
