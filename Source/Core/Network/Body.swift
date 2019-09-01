//
//  Body.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import Foundation

struct Body {
    let data: Data
    let contentType: String

    init(data: Data, contentType: String) {
        self.data = data
        self.contentType = contentType
    }
}
