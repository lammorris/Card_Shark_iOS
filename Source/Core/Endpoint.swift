//
//  Endpoint.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

protocol Endpoint {
    var httpMethod: HTTPMethod { get }
    var validStatusCodes: [Int] { get }
    func path() throws -> String
    func queryParameters() throws -> QueryParameters
    func headers() throws -> [Header.Field: Header.Value]
    func body() throws -> Body?
}
