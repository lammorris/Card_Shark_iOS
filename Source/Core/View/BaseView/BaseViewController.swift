//
//  BaseViewController.swift
//  CardDeck
//
//  Created by Morris Lam on 7/29/19.
//  Copyright © 2019 Morris Lam. All rights reserved.
//

import UIKit

class BaseViewController<RootViewType: UIView>: UIViewController {
    typealias ViewConstruction = () -> RootViewType

    // MARK: - Properties

    var rootView: RootViewType {
        return view as! RootViewType
    }

    private let viewConstruction: ViewConstruction

    // MARK: - Initialization

    init(viewConstruction: @escaping ViewConstruction = { RootViewType(frame: UIScreen.main.bounds) }) {
        self.viewConstruction = viewConstruction

        super.init(nibName: nil, bundle: nil)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func loadView() {
        view = viewConstruction()
    }

    private func setup() {
        navigationItem.largeTitleDisplayMode = .never
    }
}
