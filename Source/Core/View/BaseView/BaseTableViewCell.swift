//
//  BaseTableViewCell.swift
//  CardDeck
//
//  Created by Lam, Morris on 11/2/20.
//  Copyright © 2020 Lam, Morris. All rights reserved.
//

import UIKit

final class BaseTableViewCell: UITableViewCell, Constructable {

    // MARK: Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .white

        construct()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Construction
    func construct() {
        constructSublayerHierarchy()
        constructSubviewHierarchy()
        constructSubviewLayoutConstraints()
    }

    func constructSublayerHierarchy() { }
    func constructSubviewHierarchy() { }
    func constructSubviewLayoutConstraints() { }
}
