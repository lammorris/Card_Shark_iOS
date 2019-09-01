//
//  QueryParameters.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct QueryParameters: ExpressibleByDictionaryLiteral {
    typealias Key = String
    typealias Value = String

    private(set) var parameters: [(String, String)] = []
    var queryItems: [URLQueryItem] {
        return parameters.map(URLQueryItem.init)
    }

    init(dictionaryLiteral elements: (String, String)...) {
        parameters.append(contentsOf: elements)
    }
}
