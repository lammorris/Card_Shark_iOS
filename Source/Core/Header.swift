//
//  Header.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

struct Header: Codable {
    struct Field: Hashable {
        static let accept = "Accept"
        static let acceptCharset = "Accept-Charset"
        static let acceptLanguage = "Accept-Language"
        static let authorization = "Authorization"
        static let contentType = "Content-Type"
    }

    struct Value {
        struct Authorization {
            static func basic(_ token: String) -> String { return "Basic \(token)" }
            static func bearer(_ token: String) -> String { return "Bearer \(token)" }
        }

        struct ContentType {
            static let applicationJSON = "application/json"
            static let applicationJSONCharsetUTF8 = "application/json; charset=utf-8"
            static let urlEncoded = "application/x-www-form-urlencoded"
        }

        struct Charset {
            static let utf8 = "utf-8"
        }
    }
}

