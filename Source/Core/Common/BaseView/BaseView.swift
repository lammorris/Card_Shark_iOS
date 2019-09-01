//
//  BaseView.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

protocol Constructable {
    func construct()
    func constructSublayerHierarchy()
    func constructSubviewHierarchy()
    func constructSubviewLayoutConstraints()
}

class BaseView: UIView, Constructable {

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

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
